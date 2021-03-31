import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/providers/recipient_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/message_view.dart';

class NewMessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          /// When creating a new message, navigate to [MessageView]
          /// with no sender.

          Provider.of<RecipientProvider>(context, listen: false)
              .clearRecipient();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MessageView(),
            ),
          );
        },
        child: Text('New Message'),
      ),
    );
  }
}
