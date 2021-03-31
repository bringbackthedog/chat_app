import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';

/// Track the value of the currently selected message recipient.
class RecipientProvider extends ChangeNotifier {
  ChatUser _recipient;

  ChatUser get recipient => this._recipient;

  void updateRecipient(ChatUser recipient) {
    this._recipient = recipient;
    notifyListeners();
    log("Changed recipient to: ${recipient.userName}");
  }

  void clearRecipient() {
    this._recipient = null;
    notifyListeners();
    log("Recipient set to null.");
  }
}
