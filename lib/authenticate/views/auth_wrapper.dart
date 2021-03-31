import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/views/user_root.dart';
import 'package:flutter_chat_app/authenticate/views/authenticate.dart';
import 'package:provider/provider.dart';

/// Checks whether the user is logged in or not.
///
/// If the user is __not logged in__, redirect to the login/register views.
///
/// Otherwise, if user is __logged in__ redirect to the home page of the chat app.
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Get the current firebase user
    ///
    /// This is the value of `FirebaseAuth.instance.authStateChanges()`.
    User firebaseUser = Provider.of<User>(context);

    /// If [User] is NOT authenticated, go to login page.
    if (firebaseUser == null) return Authenticate();

    /// If [User] is authenticated, go to [UserRoot] page.
    return UserRoot();
  }
}
