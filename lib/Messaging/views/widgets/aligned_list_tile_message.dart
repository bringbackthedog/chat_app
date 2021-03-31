import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/chat_colors.dart';
import 'package:flutter_chat_app/core/helpers/dateformat.dart';
import 'package:flutter_chat_app/core/models/message.dart';

class AlignedListTileMessage extends StatelessWidget {
  AlignedListTileMessage({
    @required this.chatMessage,
    this.leftAligned = false,
  });

  final ChatMessage chatMessage;
  //  String formattedTimeStamp;
  final bool leftAligned;

  @override
  Widget build(BuildContext context) {
    Color bubbleColor = leftAligned ? ChatColors.darkBlue : ChatColors.burgundy;
    Alignment bubleAlignment =
        leftAligned ? Alignment.centerLeft : Alignment.centerRight;

    String formattedTimeStamp =
        dateFormat.format(chatMessage.timestamp.toDate());

    // Alignment getAlignment() =>
    //     leftAligned ? Alignment.centerLeft : Alignment.centerRight;

    return FractionallySizedBox(
      widthFactor: .4,
      alignment: bubleAlignment,
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            width: double
                .infinity, // As big as parent allows (FractionallySizedBox)
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(20),
              // shape: BoxShape.circle,
            ),
            child: SizedBox(child: Text(chatMessage.message)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              formattedTimeStamp,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white70,
                  ),
            ),
          )
        ],
      ),
    );
    // ListTile(
    //   tileColor: (leftAligned) ? Colors.red : Colors.blue,
    //   title: Align(
    //     alignment: getAlignment(),
    //     child: Text(
    //       chatMessage.message,
    //       style: TextStyle(
    //         fontSize: 18,
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    //   subtitle: Align(
    //     alignment: getAlignment(),
    //     child: Text(
    //       // subtitle,
    //       formattedTimeStamp,
    //       style: Theme.of(context).textTheme.caption.copyWith(
    //             color: Colors.white70,
    //           ),
    //     ),
    //   ),
    // );
  }
}
