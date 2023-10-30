// ignore_for_file: avoid_print, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ninety_nine_days_of_flutter/day_23/data/convo_data.dart';
import 'package:ninety_nine_days_of_flutter/day_23/page/chat_page.dart';
import 'package:provider/provider.dart';

class ConvoListTile extends StatelessWidget {
  final ConvoData aConvo;
  final int index;

  const ConvoListTile({
    super.key,
    required this.aConvo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // * Setting info from ConvoData
    String iconPath = aConvo.iconPath;
    String convoName = aConvo.convoName;
    String latestMsg = aConvo.chatMsg[aConvo.chatMsg.length - 1].message;
    String latestMsgSender = aConvo.chatMsg[aConvo.chatMsg.length - 1].sender;
    bool isMuted = aConvo.isMuted;
    bool isGroup = aConvo.isGroup;
    int unreadNum = aConvo.unreadNum;
    String time = aConvo.hrTime;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatPage(
                      aConvo: aConvo,
                      idx: index,
                    )));
      },
      // * Slidable widget
      child: Slidable(
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
              onPressed: (context) =>
                  Provider.of<Convo>(context, listen: false).removeConvo(index),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              label: 'Delete',
              icon: Icons.delete,
              foregroundColor: Colors.red,
              backgroundColor: const Color(0xFF222227))
        ]),
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
              onPressed: (context) =>
                  Provider.of<Convo>(context, listen: false).swapConvo(index),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              label: 'Pin',
              icon: Icons.pin_drop_rounded,
              foregroundColor: Colors.blue,
              backgroundColor: const Color(0xFF222227))
        ]),
        // * My rendition of ListPane
        child: Container(
          height: 75,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black87, width: 0.5)),
            color: Color(0xFF181818),
          ),
          child: Row(
            children: [
              // * Chat icon
              CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage(iconPath),
              ),
              // * Title
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Chat name
                      Row(
                        children: [
                          Text(
                            convoName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          isMuted
                              ? const Icon(
                                  Icons.volume_off_sharp,
                                  color: Color(0xFF4c4c4c),
                                  size: 15,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // * Most recent message
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            children: [
                              TextSpan(
                                text: isGroup ? '$latestMsgSender: ' : '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                  text: latestMsg,
                                  style:
                                      const TextStyle(color: Color(0xFF797979)))
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              // * Trailing
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 8),
                    child: Text(
                      time,
                      style: const TextStyle(color: Color(0xFF6a6a6a)),
                    ),
                  ),
                  // * Show undread msg
                  unreadNum != 0
                      ? Container(
                          decoration: BoxDecoration(
                            color: isMuted
                                ? const Color(0xFF454545)
                                : const Color(0xFF5e82fd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            child: Text(
                              unreadNum.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
