import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_app/Messaging/services/notifications.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/services/database.dart';

// TODO: create AuthService class with private fields `_db`, a `Database` instance and
// `_auth` a reference to FirebaseAuth

// TODO: create static getter `authStatus` which returns a stream of
// type `User` (a Firebase User). This stream is updated on changes to the auth state.

// TODO: Create `onSignUpWithEmail` method
//  - create a new user in FirebaseAuth using `.createUserWithEmailAndPassword`.
//    Strore the resulting `UserCredential` object in a var `userCredential`.
//  - create a `ChatUser` with the `userName` and `email` passed as arguments,
//    and the `uid` from the `userCredential` object
//  - await creation of this `ChatUser` in the db using `Database.createUserInDb`

// TODO: Create `onSignInWithEmail` method
//  - Sign user in using Firebase auth's .signInWithEmailAndPassword
//  - add Token to db using Database.addToken

// TODO: Create `onLogout` method
// - delete FCM token
// - log user out using FirebaseAuth.signOut

class AuthService {
  Future<void> onSignUpWithEmail({
    @required String userName,
    @required String email,
    @required String password,
  }) async {}

  Future<void> onSignInWithEmail(String email, String password) async {}

  Future<void> onLogout() async {}
}
