import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/Messaging/services/notifications.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/services/database.dart';

class AuthService {
  Database _db = Database();
  FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<User> get authStatus =>
      FirebaseAuth.instance.authStateChanges();

  Future<void> onSignUpWithEmail({
    @required String userName,
    @required String email,
    @required String password,
  }) async {
    UserCredential userCredential;

    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      log("Successfully created new account");
    } catch (e) {
      log("Failed to create account: ${e.toString()}");
      return null;
    }

    /// Create a [ChatUser] to write to Firestore
    ChatUser chatUser = ChatUser(
      userName: userName,
      email: email,
      uid: userCredential.user.uid,
      fcmToken: await NotificationService.token,
    );

    /// Write to Firestore
    await _db.createUserInDb(chatUser: chatUser);
  }

  Future<void> onSignInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Add the device's FCM Token for sending notifications to it.
      await _db.addToken(
          _auth.currentUser.uid, await NotificationService.token);
      log("Logged in successfully");
    } catch (e) {
      log("Failed to login: ${e.toString()}");
      return null;
    }
  }

  Future<void> onLogout() async {
    // Delete FCM Token when user logs out to stop notifications from
    // being sent to the current device.
    await _db.deleteToken(_auth.currentUser.uid);
    await _auth.signOut();
    log("Logged out successfully");
  }
}
