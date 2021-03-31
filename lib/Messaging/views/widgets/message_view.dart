import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/providers/recipient_provider.dart';
import 'package:flutter_chat_app/Messaging/view_models/message_view_model.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/logout_fab.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/message_list.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/recipient_dropdown.dart';
import 'package:flutter_chat_app/core/helpers/layout.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:provider/provider.dart';

class MessageView extends StatefulWidget {
  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  ChatUser recipient;

  /// `True`: We're creating a new message from scratch and w/o senders;
  ///
  /// `False`: We're looking at an existing conversation with another [ChatUser].
  bool newBlankMessage;

  @override
  Widget build(BuildContext context) {
    MessageViewModel messageViewModel = Provider.of<MessageViewModel>(context);

    recipient = Provider.of<RecipientProvider>(context).recipient;
    newBlankMessage =
        messageViewModel.getMessagesBetweenUserAnd(recipient).isEmpty;

    bool emptyRecipient = recipient == null;

    /// Validate message before sending.
    _validator(_message) {
      if (_message.isEmpty) {
        return "Message cannot be empty"; // error
      } else if (emptyRecipient) {
        return "Must select recipient"; // error
      }
      return null; // no error
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double colWidth = getColumnWidthForThisScreen(screenWidth, maxColWidth);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: (newBlankMessage)
            ?

            /// Dropdown of users
            RecipientsDropdown()
            :

            /// Show the name of the interlocutor
            Text(recipient.userName),
      ),

      /// Logout FAB Button
      floatingActionButton: LogoutFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: SafeArea(
        child: Center(
          child: Container(
            width: colWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// List of messages
                Expanded(
                  flex: 9, //
                  child: MessageList(interlocutor: recipient),
                ),

                /// Message Content TextFormField
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5, bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white54,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: .8 * colWidth,
                            child: TextFormField(
                              key: messageViewModel.messageFormKey,
                              controller: messageViewModel.messageController,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Message",
                                contentPadding: EdgeInsets.only(left: 14),
                              ),
                              validator: _validator,
                            ),
                          ),

                          /// Send Button
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  messageViewModel.sendMsgTo(recipient);
                                  newBlankMessage = false;
                                });
                              },
                              iconSize: 25,
                              icon: Icon(
                                Icons.send,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
