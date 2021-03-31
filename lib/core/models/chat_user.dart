import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatUser {
  String userName;
  String uid;
  String email;
  String fcmToken;

  ChatUser({
    @required this.userName,
    @required this.uid,
    this.email,
    this.fcmToken,
  });

  ChatUser.fromMap(Map<String, dynamic> userDataMap) {
    this.userName = userDataMap['userName'];
    this.uid = userDataMap['uid'];
    this.email = userDataMap['email'];
    this.fcmToken = userDataMap['fcmToken'];
  }

  Map<String, String> toMap() => {
        "uid": uid,
        "userName": userName,
        "email": email,
        "fcmToken": fcmToken,
      };
}
