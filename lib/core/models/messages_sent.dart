import 'package:flutter_chat_app/core/models/message.dart';

// TODO: Create `MessagesSent` model with field `list` of type  List<ChatMessage>

/// `MessagesReceived` and `MessagesSent` objects are only a `List<ChatMessage>`.
///
/// We use them because `Provider` tracks types signature. If we try to track
/// two different `List<ChatMessage>`, we will only get one; the one closest to
/// the caller in the widget tree.
///
/// i.e. `Provider.of<List<ChatMessage>>` returns the first `List<ChatMessage>`
/// found in the current `context`.
///
///
/// By encapsulating the `List<ChatMessage>` in it's own class, we are giving them
/// a different signature. Now `Provider` can properly track their type and it
/// will behave as expected.
///
/// i.e.: Now we can use `Provider.of<MessagesReceived>.list` or
/// `Provider.of<MessagesSent>.list`.
/// And `Provider.of<MessagesReceived>.list` != `Provider.of<MessagesSent>.list`
///
///

/// List of all messages sent by this user.
