import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';
import 'package:flutter_chat_app/core/views/loading_screen.dart';
import 'package:provider/provider.dart';

class MessageViewModelProvider extends StatelessWidget {
  /// This provider creates a [MessageViewModel] and injects it in the sub tree.
  ///
  /// This groups [MessagesReceived], [MessagesSent] and [List\<ChatUser\>] within
  /// the [MessageViewModel] and gives its [MessageViewModel]methods to all
  /// descendant widgets.
  MessageViewModelProvider({this.builder});
  final Widget Function(BuildContext, Widget) builder;

  @override
  Widget build(BuildContext context) {
    ChatUser chatUser = Provider.of<ChatUser>(context);
    MessagesReceived messagesReceived = Provider.of<MessagesReceived>(context);
    MessagesSent messagesSent = Provider.of<MessagesSent>(context);
    List<ChatUser> chatUsers = Provider.of<List<ChatUser>>(context);

    /// Wait for the messages and list of [ChatUser]s to be available.
    if (messagesReceived == null || messagesSent == null || chatUsers == null)
      return LoadingScreen();

    return Provider<MessageViewModel>.value(
      value: MessageViewModel(
          chatUser: chatUser,
          messagesReceived: messagesReceived,
          messagesSent: messagesSent,
          chatUsers: chatUsers),
      builder: builder,
    );
  }
}
