import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

/// see FCM doc: https://firebase.flutter.dev/docs/messaging/usage/

class NotificationService {
  static FirebaseMessaging _fcm = FirebaseMessaging.instance;

  /// Key for web notifications. Generated in Firebase project.
  static const String _vapidKey =
      "BPWQW10HgthT2-mX5Dfa1QwhTkEaVHwukUnKxNv8SFYdFZkdM7b4ZC1PLLsSDJw29n4NzAzBo3_QXLx97lZExl4";

  /// Requesting permission (Apple & Web)
  ///
  /// On Android authorizationStatus is always authorized.
  static Future<void> requestPermissions() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');
  }

  /// Get FCM token for this device (mobile).
  static Future<String> get token async {
    String _token = await FirebaseMessaging.instance.getToken(
      vapidKey: _vapidKey,
    );

    log("fcm token: $_token");
    return _token;
  }

  /// Handle foreground messages.
  static listenForForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');

        RemoteNotification notification = message.notification;
        String title = notification.title;
        String body = notification.body;
        log("title: $title");
        log("body: $body");
      }
    });
  }

  /// Handle background messages.
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    log("Handling a background message: ${message.messageId}");
    RemoteNotification notification = message.notification;
    String title = notification.title;
    String body = notification.body;
    log("title: $title");
    log("body: $body");
  }
}
