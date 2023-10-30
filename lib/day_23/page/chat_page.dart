import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_23/data/convo_data.dart';
import 'package:ninety_nine_days_of_flutter/day_23/widgets/frosted_glass_box.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final ConvoData aConvo;
  final int idx;
  const ChatPage({super.key, required this.aConvo, required this.idx});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // * Setting info
  late String convoName;
  late String iconPath;

  // * Text controller to send message
  TextEditingController msgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    convoName = widget.aConvo.convoName;
    iconPath = widget.aConvo.iconPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Stack(
        children: [
          // * Chat
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/day_22/chatBG.jpg'),
              fit: BoxFit.cover,
            )),
            height: 1000,
            width: double.infinity,
          ),
          // * Textfield
          Positioned(
            bottom: 10,
            left: 10, // Added
            right: 10, // Added
            child: TextField(
              controller: msgController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1e1e1e),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Message',
                  hintStyle: const TextStyle(color: Colors.white70),
                  suffixIcon: IconButton(
                      onPressed: () {
                        msgController.text != ''
                            ? Provider.of<Convo>(context, listen: false)
                                .addMessage(
                                    widget.idx, msgController.text, 'Me')
                            : msgController;

                        msgController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ))),
            ),
          ),

          // * Chat area
          Positioned(
            bottom: 75,
            left: 10,
            right: 10,
            child: SizedBox(
              height: 1000,
              child: Consumer<Convo>(
                builder: (context, value, child) {
                  return ListView.builder(
                    reverse:
                        true, // This ensures the list starts from the bottom
                    itemCount: value.convos[widget.idx].chatMsg.length,
                    itemBuilder: (context, messageIdx) {
                      // Access messages in the reverse order.
                      var currentMessage = value.convos[widget.idx].chatMsg[
                          value.convos[widget.idx].chatMsg.length -
                              1 -
                              messageIdx];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            border:
                                Border.all(color: Colors.white, width: 1.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentMessage.message,
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(height: 5),
                            Text(currentMessage.sender,
                                style: const TextStyle(color: Colors.white70)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // * Top panel
          FrostedGlassBox(
            height: 100,
            width: double.infinity,
            bgColorOne: const Color(0xFF181818),
            bgColorTwo: const Color(0xFF181818),
            bgOpacityOne: 0.5,
            bgOpacityTwo: 0.5,
            sigX: 2,
            sigY: 2,
            radius: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 15,
                    right: 15,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 15),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(iconPath),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 15,
                  ),
                  child: Text(
                    convoName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.3,
                        fontSize: 20),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(top: 25, right: 15),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
