import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';
import 'package:flutter_chat_app/core/services/database.dart';
import 'package:flutter_chat_app/core/views/loading_screen.dart';
import 'package:provider/provider.dart';

// TODO: Create statless widgeet `MessageProviders` with `child` member of type `widget`
//
// TODO: Declare instance of `Database` db
// TODO: Using Provider, get the value of `ChatUser` and store it in a var `chatUser`
// TODO: If/while chatUser is null (is async so during fetch), return `LoadingScreen` widget
// TODO: Otherwise, return a MultiProvider
//          - StreamProvider<MessagesSent>
//          - StreamProvider<MessagesReceived>
//          - StreamProvider<List<ChatUser>>
// TODO: Set `lazy` parameters to false
// TODO: Set child to child

class MessageProviders extends StatelessWidget {}
