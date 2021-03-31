import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';
import 'package:flutter_chat_app/core/services/database.dart';
import 'package:flutter_chat_app/core/views/loading_screen.dart';
import 'package:provider/provider.dart';

class MessageProviders extends StatelessWidget {
  /// Injects providers of [MessagesReceived], [MessagesSent] and [List\<ChatUser\>]
  MessageProviders({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// The currently logged in [ChatUser].
    ChatUser chatUser = Provider.of<ChatUser>(context); // i.e. listen:true

    /// Wait for the value of chatUser to be available.
    if (chatUser == null) return LoadingScreen();

    Database db = Database();
    return MultiProvider(
      providers: [
        /// Track the value of the list of messages sent to this user.
        StreamProvider<MessagesReceived>.value(
          value: db.getMessagesSentToUser(chatUser: chatUser),
          lazy: false,
        ),

        /// Track the value of the list of messages sent by this user.
        StreamProvider<MessagesSent>.value(
          value: db.getMessagesSentByUser(chatUser: chatUser),
          lazy: false,
        ),

        /// Track the value of the list of all users.
        // StreamProvider<List<ChatUser>>.value(value: db.getUserList()),
        StreamProvider<List<ChatUser>>.value(
          value: db.getUserList(),

          /// Get the value right away, as opposed to waiting for a `Provider.of` call
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}
