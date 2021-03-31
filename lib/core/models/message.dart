import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  ChatMessage({
    this.message,
    this.recipientUID,
    this.recipientUsername,
    this.senderUID,
    this.senderUsername,
    this.timestamp,
  });

  String message;
  String senderUID;
  String senderUsername;
  String recipientUID;
  String recipientUsername;
  Timestamp timestamp;

  Map<String, dynamic> toMap() {
    return {
      "message": message,
      "senderUID": senderUID,
      "senderUsername": senderUsername,
      "recipientUID": recipientUID,
      "recipientUsername": recipientUsername,
      "timestamp": Timestamp.now()
    };
  }

  ChatMessage.fromMap(Map<String, dynamic> msgData) {
    message = msgData['message'];
    recipientUID = msgData['recipientUID'];
    senderUID = msgData['senderUID'];
    timestamp = msgData['timestamp'];
    recipientUsername = msgData['recipientUsername'];
    senderUsername = msgData['senderUsername'];
  }
}
