import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/helpers/dateformat.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/models/message.dart';
import 'package:flutter_chat_app/core/models/messages_received.dart';
import 'package:flutter_chat_app/core/models/messages_sent.dart';
import 'package:flutter_chat_app/core/services/database.dart';

// TODO: create sendMsgTo method:
//    - validate messageFormKey. Store result in bool `_msgHasContent`
//    - check if recipient == null. Store result in bool `emptyRecipient`
//    - If !msgHasContent or emptyRecipient, return;
//
//    - Otherwise, call Database.onSendMessage
//    - Clear the `messageController` (i.e. set to empty string)
//
// TODO: create getMessagesSentTo method:
// - return null if : recipientUsername == null || messagesSent == null
// - return this.messageSent list where  message.recipientUsername == recipientUsername
//
//// TODO: create getMessagesReceivedFrom method:
// - return null if enderUsername == null || messagesReceived == null
// - return this.messageSent list where  message.senderUsername == senderUsername;
//
// TODO: create getMessagesBetweenUserAnd method:
// - if interlocutor is null OR  (messagesReceived & messagesSent) are null, return null
// - Create var messagesFromInterlocutor: call `getMessagesReceivedFrom` w interloctur.userName
// - Create var messagesToInterlocutor: call `getMessagesSentTo` w interloctur.userName
// - Combine the 2 list (+) into a var `messageList`
// - sort `messageList`: compare msg1 timestamp to msg2
// - return `messageList`

//// TODO: create getMessagesReceivedFrom method:
// -   ChatMessage lastMessageFromSender =getMessagesReceivedFrom(senderUsername).last;
// - format it using String lastMessageTime = dateFormat.format(lastMessageFromSender.timestamp.toDate());
// - return it: return lastMessageTime

// TODO: create getMessagesReceivedFrom method:
// - chatUsers?.singleWhere((ChatUser chatUser) => chatUser.userName == interlocutorUsername));

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
  ChatUser getInterlocutorWithUsername(String interlocutorUsername) {}

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
  Future<void> sendMsgTo(ChatUser recipient) async {}

  /// Get messages from a particular sender.
  List<ChatMessage> getMessagesReceivedFrom(String senderUsername) {}

  /// Get messages to a particular sender.
  List<ChatMessage> getMessagesSentTo(String recipientUsername) {}

  /// Get all messages between the user and the interlocutor. Sorted by time
  /// stamp.
  ///
  /// Returns empty list if `interlocutor == null` or if there are no messages.
  List<ChatMessage> getMessagesBetweenUserAnd(ChatUser interlocutor) {}

  /// Get the [TimeStamp] as a [String] of the last message from a particular sender.
  String getTimeOfLastMessageFrom(String senderUsername) {}
}
