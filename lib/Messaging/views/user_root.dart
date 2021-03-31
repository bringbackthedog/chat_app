import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/providers/chat_user_provider.dart';
import 'package:flutter_chat_app/Messaging/providers/message_view_model_provider.dart';
import 'package:flutter_chat_app/Messaging/providers/messages_provider.dart';
import 'package:flutter_chat_app/Messaging/providers/recipient_provider.dart';
import 'package:flutter_chat_app/Messaging/views/message_home_view.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/message_navigator.dart';
import 'package:provider/provider.dart';

class UserRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// List of messages sent to this user.

    return ChatUserProvider(
      child: MessageProviders(
        /// Creating a separate [Navigator] once the [ChatUser] is authenticated.
        child: MessageViewModelProvider(
          builder: (context, _) {
            return ChangeNotifierProvider<RecipientProvider>(
              create: (context) => RecipientProvider(),
              child: MessageNavigator(
                builder: (context) {
                  return MessageHomeView();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
