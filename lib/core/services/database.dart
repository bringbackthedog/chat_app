import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';

class Database {
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference _messagesCollectionRef =
      FirebaseFirestore.instance.collection("messages");

  ///
  /// Helper Function
  ///
  List<ChatMessage> _snapshotToMessageList(QuerySnapshot msgListSnapshot) {
    // No message case
    if (msgListSnapshot.docs.isEmpty) return [];

    /// Initialize an empty list of [ChatMessage]s
    List<ChatMessage> msgList = [];

    /// Add the messages from Firestore to the list.
    for (QueryDocumentSnapshot msgDoc in msgListSnapshot.docs) {
      Map<String, dynamic> msgData = msgDoc.data();

      ChatMessage msg = ChatMessage.fromMap(msgData);
      msgList.add(msg);
    }

    return msgList;
  }

  /// Create [ChatUser] in users collections
  Future createUserInDb({@required ChatUser chatUser}) async {
    await _usersCollectionRef.doc(chatUser.uid).set(chatUser.toMap());
    log("User ${chatUser.userName} created in database.");
  }

  ///
  Future<ChatUser> getUserFromDb({
    @required String uid,
  }) async {
    /// Wait for firebase as data is created
    await Future.delayed(Duration(milliseconds: 1500));
    DocumentSnapshot userSnapshot = await _usersCollectionRef.doc(uid).get();
    Map<String, dynamic> _userData = userSnapshot.data();

    return ChatUser.fromMap(_userData);
  }

  /// Get data of all other users available to send message to.
  Stream<List<ChatUser>> getUserList() {
    List<ChatUser> _convertSnapshotToChatUserList(
        QuerySnapshot _userCollectionSnapshot) {
      List<QueryDocumentSnapshot> _userDocList = _userCollectionSnapshot.docs;

      /// Check that we're actually getting some users.
      if (_userDocList.isEmpty) return [];

      List<ChatUser> chatUserList = [];
      for (QueryDocumentSnapshot _userDoc in _userDocList) {
        Map<String, dynamic> _userData = _userDoc.data();
        ChatUser _chatUser = ChatUser.fromMap(_userData);
        chatUserList.add(_chatUser);
      }
      return chatUserList;
    }

    return _usersCollectionRef.snapshots().map(_convertSnapshotToChatUserList);
  }

  ///
  Future<void> onSendMessage({ChatMessage chatMessage}) async {
    await _messagesCollectionRef.add(chatMessage.toMap());
    log("sent message: ${chatMessage.message}");
  }

  /// Gets a list of [ChatMessage]s received by this user.
  ///
  /// Returns an empty list if there are none.
  Stream<MessagesReceived> getMessagesSentToUser(
      {@required ChatUser chatUser}) {
    if (chatUser == null) return null;
    return _messagesCollectionRef
        .where("recipientUID", isEqualTo: chatUser.uid)
        .orderBy("timestamp" /* descending: false */)
        .snapshots()
        .map(_snapshotToMessageList)
        .map((msgList) => MessagesReceived(list: msgList));
  }

  /// Gets a list of [ChatMessage]s sent by this user.
  ///
  /// Returns an empty list if there are none.
  Stream<MessagesSent> getMessagesSentByUser({@required ChatUser chatUser}) {
    if (chatUser == null) return null;
    return _messagesCollectionRef
        .where("senderUID", isEqualTo: chatUser.uid)
        .orderBy("timestamp" /* descending: false */)
        .snapshots()
        .map(_snapshotToMessageList)
        .map((msgList) => MessagesSent(list: msgList));
  }

  /// Delete the FCM Token from currently logged in user
  Future<void> deleteToken(String uid) async {
    await _usersCollectionRef.doc(uid).set(
      {"fcmToken": null},
      SetOptions(merge: true),
    );
  }

  Future<void> addToken(String uid, String fcmToken) async {
    await _usersCollectionRef.doc(uid).set(
      {"fcmToken": fcmToken},
      SetOptions(merge: true),
    );
  }
}
