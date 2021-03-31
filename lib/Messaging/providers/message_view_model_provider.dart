import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';
import 'package:flutter_chat_app/core/views/loading_screen.dart';
import 'package:provider/provider.dart';

// TODO: Create `MessageViewModelProvider` stateless widget with params `builder`
// of type Widget Function(BuildContext, Widget) builder
//
// TODO: Create a Provider<MessageViewModel> with the data passed in constructor
// TODO: Create a Provider<MessageViewModel> with the data passed in constructor

// TODO: Using Provider fetch  chatUser, messagesReceived, messagesSent and chatUserList
// TODO: If messagesReceived, messagesSent or chatUserList are null (i.e. still downloading)
//        return LoadingScreen
// TODO: Create a Provider<MessageViewModel> with the data passed in constructor

class MessageViewModelProvider extends StatelessWidget {
  /// This provider creates a [MessageViewModel] and injects it in the sub tree.
  ///
  /// This groups [MessagesReceived], [MessagesSent] and [List\<ChatUser\>] within
  /// the [MessageViewModel] and gives its [MessageViewModel]methods to all
  /// descendant widgets.

}
