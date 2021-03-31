import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/services/notifications.dart';
import 'package:flutter_chat_app/authenticate/services/auth_service.dart';
import 'package:flutter_chat_app/core/chat_app_theme.dart';
import 'package:flutter_chat_app/authenticate/views/auth_wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(
      NotificationService.handleBackgroundMessage);

  await Firebase.initializeApp();

  /// Requesting permission (Apple & Web)
  await NotificationService.requestPermissions();

  /// log Token only (delete this)
  await NotificationService.token;

  /// listen for messages
  NotificationService.listenForForegroundMessages();

  /// Toggle to use local emulator for Firestore (mobile only).
  /// Emulators must be running.
  // EmulatorService.useFirestoreEmulator; //

  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// We want to have access to value of `FirebaseAuth.instance.authStateChanges()`,
    /// the current state of authentication (i.e.logged in/logged out),
    /// through the whole app.
    ///
    /// We're injecting the live `value` of `FirebaseAuth.instance.authStateChanges()`
    /// in the widget tree.
    /// This value will be accessible in all descendant widgets by looking
    /// for a [Provider] of type [User]
    /// (as `FirebaseAuth.instance.authStateChanges()` returns a [User] [Stream]).
    ///
    /// e.g. `Provider.of<User>(context);` would fetch that value from anywhere
    /// in the app.
    ///
    ///
    return StreamProvider<User>.value(

        /// `FirebaseAuth.instance.authStateChanges()` returns a
        /// [User] object if a user is logged in firebase.
        /// Will return `null` otherwise.
        value: AuthService.authStatus,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: chatAppTheme,
            home: AuthWrapper(),
          );
        });
  }
}
