import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/providers/recipient_provider.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/logout_fab.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/message_view.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/new_message_button.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:provider/provider.dart';

class MessageHomeViewBody extends StatelessWidget {
  MessageHomeViewBody({@required this.messageViewModel});
  final MessageViewModel messageViewModel;

  @override
  Widget build(BuildContext context) {
    RecipientProvider recipientProvider =
        Provider.of<RecipientProvider>(context, listen: false);

    /// When tapping on this card:
    ///   - update the recipient
    ///   - navigate to the [MessageView]
    navigateToMessageView(BuildContext context, {String interlocutorUsername}) {
      ChatUser interlocutor =
          messageViewModel.getInterlocutorWithUsername(interlocutorUsername);

      recipientProvider.updateRecipient(interlocutor);

      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MessageView(),
        ),
      );
    }

    return Scaffold(
      /// Logout FAB Button
      floatingActionButton: LogoutFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                messageViewModel.chatUser.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.separated(
                shrinkWrap: true, // ! Column has infinite height !
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white70,
                  // indent: 30,
                  // endIndent: 30,
                  thickness: 1.5,
                ),
                itemCount: messageViewModel.interlocutorUsernames.length,
                itemBuilder: (context, index) {
                  String interlocutorUsername =
                      messageViewModel.interlocutorUsernames.elementAt(index);

                  /// Get last message sent by sender.
                  String lastMessageTime = messageViewModel
                      .getTimeOfLastMessageFrom(interlocutorUsername);

                  return InkWell(
                    onTap: () {
                      return navigateToMessageView(
                        context,
                        interlocutorUsername: interlocutorUsername,
                      );
                    },
                    //
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 7, child: Text(interlocutorUsername)),
                          Expanded(
                            flex: 3,
                            child: Text(
                              lastMessageTime,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            ///
            /// NEW MESSAGE BUTTON
            ///
            Flexible(
              flex: 1,
              child: NewMessageButton(),
            )
          ],
        ),
      ),
    );
  }
}
