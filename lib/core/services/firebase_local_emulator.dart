import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

/// Helper class to config Firebase emulator in Flutter
///
/// (Current implementation is for mobile only).
class EmulatorService {
  static String _firestoreHost =
      Platform.isAndroid ? '10.0.2.2:8080' : 'localhost:8080';

  /// Setting "use emulator for Firestore"
  static void get useFirestoreEmulator =>
      FirebaseFirestore.instance.settings = Settings(
        host: _firestoreHost,
        sslEnabled: false,
        persistenceEnabled: false,
      );
}
