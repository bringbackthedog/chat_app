import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/aligned_list_tile_message.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  MessageList({@required this.interlocutor});
  final ChatUser interlocutor;

  @override
  Widget build(BuildContext context) {
    MessageViewModel messageViewModel = Provider.of<MessageViewModel>(context);

    /// A list of messages exchanged between the two users.
    List<ChatMessage> messagesBetween =
        messageViewModel.getMessagesBetweenUserAnd(interlocutor);

    if (messagesBetween.isEmpty) return Container();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: messagesBetween.length,
      itemBuilder: (context, index) {
        ChatMessage chatMessage = messagesBetween[index];
        bool leftAligned = chatMessage.senderUsername == interlocutor.userName;
        return AlignedListTileMessage(
          chatMessage: chatMessage,
          leftAligned: leftAligned,
        );
      },
    );
  }
}
