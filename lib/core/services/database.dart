import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';

// TODO:  Create references to 'users' and 'messages' Collections (tables)

// TODO: `createUserInDb` method using `doc.set(model.toMap)`, where the document name
// is the `uid` (unique identifier) of the user

// TODO: create `getUserFromDb` method using `doc.get` and return the `model.fromMap`,
// where `doc.data()` is the map

// TODO: create `_snapshotToMessageList` private helper function.
// This method maps every element of a stream into a `ChatMessage`
//  - Takes a `QuerySnapshot` (result from db when using .snaphot()).
//  - Returns an empty list if snapshot has no documents (i.e. no messages)
//  - Creates a list of `ChatMessage`
//  - For every doc in the QuerySnapshot docs we add the doc to the list, decoded
//    into a `ChatMessage` using `ChatMessage.toMap`
//  - Return the list of `ChatMessage`

// TODO: create `getMessagesSentToUser` method
// `getMessagesSentToUser` query
//    - looks for docs in the db where the field `recipientUID` matches
//    the uid of the `ChatUser` passed,
//    - orders the docs them by `timeStamp` field
//    - Maps to a List<ChatMessage> using `_snapshotToMessageList` helper
//    - And finally instantiates and return `MessagesReceived` by mapping the resulting
//      stream
//
// TODO: create `getMessagesSentByUser` method.
// Same as `getMessagesSentToUser` but matches field `senderUID` (instead of recipientUID) to
// the `ChatUser` uid

//  TODO: create `getUserList` method
//  - returns the users collection as a stream (using collection.snapshot)
//  - maps the resulting stream to a `ChatUser` list using
//    helper function `_convertSnapshotToChatUserList`
//  TODO: create helper  `_convertSnapshotToChatUserList` within the scope of `getUserList`
//  -  Takes a `QuerySnapshot` (result of stream query)
//  - If the `QuerySnapshot` has no documents (i.e. no users), returns an empty list
//  - Creates a list of `ChatUser`
//  - For every doc in snapshot add `ChatUser` to list using `ChatUser.toMap`
//  - return list

//  TODO: create `onSendMessage` method
//  - adds a ChatMessage to `messages` collection using `ChatMessage.toMap`

//  TODO: create `deleteToken` method to delete the device token from db on sign out
//  - sets the `fcmToken` field to null for the doc name of `uid` passed
//  - uses `SetOptions(merge: true)` as a second argument to set as to not override the
//    whole document but only that one field
//
//  TODO: create `addToken` method to add the device token to db on sign in
//  - sets the `fcmToken` field to the `fcmToken` string passed,
//   for the doc name of `uid` passed as argument.
//  - uses `SetOptions(merge: true)` as a second argument to set as to not override the
//    whole document but only that one field

class Database {
  ///
  /// Helper Function
  ///
  List<ChatMessage> _snapshotToMessageList(QuerySnapshot msgListSnapshot) {
    // No message case

    /// Initialize an empty list of [ChatMessage]s

    /// Add the messages from Firestore to the list.
  }

  /// Create [ChatUser] in users collections
  Future createUserInDb({@required ChatUser chatUser}) async {}

  ///
  Future<ChatUser> getUserFromDb({
    @required String uid,
  }) async {
    /// Wait for firebase as data is created
    await Future.delayed(Duration(milliseconds: 1500));
  }

  /// Gets a list of [ChatMessage]s received by this user.
  ///
  /// Returns an empty list if there are none.
  Stream<MessagesReceived> getMessagesSentToUser(
      {@required ChatUser chatUser}) {}

  /// Gets a list of [ChatMessage]s sent by this user.
  ///
  /// Returns an empty list if there are none.
  Stream<MessagesSent> getMessagesSentByUser({@required ChatUser chatUser}) {}

  /// Get data of all other users available to send message to.
  Stream<List<ChatUser>> getUserList() {
    List<ChatUser> _convertSnapshotToChatUserList(
        QuerySnapshot _userCollectionSnapshot) {}
  }

  ///
  Future<void> onSendMessage({ChatMessage chatMessage}) async {}

  /// Delete the FCM Token from currently logged in user
  Future<void> deleteToken(String uid) async {}

  Future<void> addToken(String uid, String fcmToken) async {}
}
