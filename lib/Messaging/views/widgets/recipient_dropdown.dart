import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/providers/recipient_provider.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:provider/provider.dart';

class RecipientsDropdown extends StatefulWidget {
  @override
  _RecipientsDropdownState createState() => _RecipientsDropdownState();
}

class _RecipientsDropdownState extends State<RecipientsDropdown> {
  /// Initial dropdownValue.
  String dropdownValue;

  /// List of all available users.
  List<ChatUser> fullUserList;

  @override
  Widget build(BuildContext context) {
    /// Rebuild the dropdown (this widget) every time the list of [ChatUser]s changes.
    fullUserList = Provider.of<List<ChatUser>>(context);

    RecipientProvider recipientProvider =
        Provider.of<RecipientProvider>(context);
    dropdownValue = recipientProvider?.recipient?.userName;

    /// If we don't have the list of users yet, show loading.
    if (fullUserList == null) return CircularProgressIndicator();

    return Container(
      padding: EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        hint: Text(
          "SEND TO:",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        value: dropdownValue, // *originally null
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          color: Colors.blue[600],
        ),

        onChanged: (String newRecipientUserName) {
          ChatUser newRecipient = fullUserList.firstWhere(
              (ChatUser chatUser) => chatUser.userName == newRecipientUserName);
          recipientProvider.updateRecipient(newRecipient);
        },
        items: fullUserList.map<DropdownMenuItem<String>>((ChatUser chatUser) {
          return DropdownMenuItem<String>(
            value: chatUser.userName,
            child: Text(chatUser.userName),
          );
        }).toList(),
      ),
    );
  }
}
