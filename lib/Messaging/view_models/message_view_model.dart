import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/helpers/dateformat.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';
import 'package:flutter_chat_app/core/services/database.dart';

class MessageViewModel {
  MessageViewModel({
    @required this.chatUser,
    @required this.messagesReceived,
    @required this.messagesSent,
    @required this.chatUsers,
  }) {
    if (messagesReceived != null)

      /// Add unique senders to senders [Set].
      messagesReceived.list.forEach(
          (message) => interlocutorUsernames.add(message.senderUsername));
  }

  /// Set of unique senders.
  Set<String> interlocutorUsernames = {};

  /// Get interlocutor with username
  ChatUser getInterlocutorWithUsername(String interlocutorUsername) {
    return chatUsers?.singleWhere(
        (ChatUser chatUser) => chatUser.userName == interlocutorUsername);
  }

  /// The currently logged in user.
  ChatUser chatUser;
  MessagesReceived messagesReceived;
  MessagesSent messagesSent;

  /// List of all users.
  List<ChatUser> chatUsers;

  /// When sending a message, the message content is the value of this text field.
  TextEditingController messageController = TextEditingController(text: "");

  /// When sending a message, the key for the TextFormField for the message content.
  ///
  /// This allows to use do some validation of the current state of the text
  /// field using `validate()` _before_ using its content (i.e. to ensure text
  ///  field is not empty).
  GlobalKey<FormFieldState> messageFormKey = GlobalKey<FormFieldState>();

  /// Sending a message
  Future<void> sendMsgTo(ChatUser recipient) async {
    // Database _database = Database();
    bool _msgHasContent = messageFormKey.currentState.validate();
    bool emptyRecipient = recipient == null;

    /// No content or no recipient, don't send.
    if (!_msgHasContent || emptyRecipient) {
      return;
    }

    /// Send message
    await Database().onSendMessage(
      chatMessage: ChatMessage(
        message: messageController.text,
        senderUsername: chatUser.userName,
        senderUID: chatUser.uid,
        recipientUID: recipient.uid,
        recipientUsername: recipient.userName,
      ),
    );

    /// Clear the textfield
    messageController.text = '';

    return;
  }

  /// Get messages from a particular sender.
  List<ChatMessage> getMessagesReceivedFrom(String senderUsername) {
    if (senderUsername == null || messagesReceived == null) return null;

    return messagesReceived.list.where((message) {
      return message.senderUsername == senderUsername;
    }).toList();
  }

  /// Get messages to a particular sender.
  List<ChatMessage> getMessagesSentTo(String recipientUsername) {
    if (recipientUsername == null || messagesSent == null) return null;

    return messagesSent.list.where((message) {
      return message.recipientUsername == recipientUsername;
    }).toList();
  }

  /// Get all messages between the user and the interlocutor. Sorted by time
  /// stamp.
  ///
  /// Returns empty list if `interlocutor == null` or if there are no messages.
  List<ChatMessage> getMessagesBetweenUserAnd(ChatUser interlocutor) {
    if (interlocutor == null) return [];
    if (messagesSent == null && messagesReceived == null) return [];

    List<ChatMessage> messagesFromInterlocutor =
        getMessagesReceivedFrom(interlocutor.userName);
    List<ChatMessage> messagesToInterlocutor =
        getMessagesSentTo(interlocutor.userName);

    List<ChatMessage> messageList =
        messagesFromInterlocutor + messagesToInterlocutor;

    /// Sort messages by time stamp
    messageList.sort((msg1, msg2) => msg1.timestamp.compareTo(msg2.timestamp));
    return messageList;
  }

  /// Get the [TimeStamp] as a [String] of the last message from a particular sender.
  String getTimeOfLastMessageFrom(String senderUsername) {
    ChatMessage lastMessageFromSender =
        getMessagesReceivedFrom(senderUsername).last;

    String lastMessageTime =
        dateFormat.format(lastMessageFromSender.timestamp.toDate());

    return lastMessageTime;
  }
}
