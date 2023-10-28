import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_22/data/convo_data.dart';
import 'package:ninety_nine_days_of_flutter/day_22/widgets/frosted_glass_box.dart';

class ChatPage extends StatefulWidget {
  final ConvoData aConvo;
  const ChatPage({super.key, required this.aConvo});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // * Setting info
  late String convoName;
  late String iconPath;

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
          const Positioned(
            bottom: 10,
            left: 10, // Added
            right: 10, // Added
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1e1e1e),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Message',
                icon: Icon(Icons.abc),
                hintStyle: TextStyle(color: Colors.white70),
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
                  padding: const EdgeInsets.only(
                    top: 25,
                    right: 15,
                  ),
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
