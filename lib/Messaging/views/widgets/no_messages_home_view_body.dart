import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/logout_fab.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/new_message_button.dart';

class NoMessagesHomeViewBody extends StatelessWidget {
  NoMessagesHomeViewBody({@required this.messageViewModel});
  final messageViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LogoutFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              messageViewModel.chatUser.userName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text("No Messages"),
            ),
          ),
          Flexible(
            flex: 2,
            child: NewMessageButton(),
          )
        ],
      ),
    );
  }
}
