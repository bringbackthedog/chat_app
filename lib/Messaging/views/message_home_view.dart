import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/message_home_view_body.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/no_messages_home_view_body.dart';
import 'package:provider/provider.dart';

/// A list view of all messages send to this user
class MessageHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MessageViewModel messageViewModel =
        Provider.of<MessageViewModel>(context, listen: false);

    /// No messages for this [Chatuser] case.
    if (messageViewModel.messagesReceived == null ||
        messageViewModel.messagesReceived.list.isEmpty)
      return NoMessagesHomeViewBody(messageViewModel: messageViewModel);

    /// Found messages for this [Chatuser].
    return MessageHomeViewBody(messageViewModel: messageViewModel);
  }
}
