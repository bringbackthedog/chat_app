// TODO: Create `MessagesReceived` model with field `list` of type  List<ChatMessage>

/// `MessagesReceived` and `MessagesSent` objects are only a `List<ChatMessage>`.
///
/// We use them because `Provider` tracks types signature. If we try to track
/// two different `List<ChatMessage>`, we will only get one, the one closest to
/// the caller in the widget tree.
///
/// By encapsulating the `List<ChatMessage>` in a class, we are givivng them
/// a different signature. Now `Provider` can properly track their type and it
/// will behave as expected.

/// List of all messages sent to this user.
