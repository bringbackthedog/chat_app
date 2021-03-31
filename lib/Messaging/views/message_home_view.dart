import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/message_home_view_body.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/no_messages_home_view_body.dart';
import 'package:provider/provider.dart';

// TODO: Create StatelessWidget `MessageHomeView`
// TODO: Using provider, get an instance of `MessageViewModel`. Store it in a var.
// ! We DON'T want to rebuild on changes to this object, since the parent providers already do this.
// TODO: If messagesReceived.list.isEmpty return `NoMessagesHomeViewBody` widget,
// passing the `messageViewModel` in the constructor
// TODO: Otherwise, return `MessageHomeViewBody` widget,passing the `messageViewModel` in the constructor.

/// A list view of all messages send to this user
