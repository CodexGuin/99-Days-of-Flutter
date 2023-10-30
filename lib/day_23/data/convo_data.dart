import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Convo with ChangeNotifier {
  final List<ConvoData> _convos = [
    ConvoData(
      convoName: 'Tony Ton',
      iconPath: 'assets/images/day_20/1.jpg',
      hrTime: '4:51 PM',
      unreadNum: 14,
      chatMsg: [
        Messages(
            message: 'Did you see that game last night?', sender: 'Tony Ton'),
        Messages(message: 'Totally crazy!', sender: 'Me'),
        Messages(message: 'I know right! Best game ever.', sender: 'Tony Ton'),
      ],
    ),
    ConvoData(
      convoName: 'Besties Outing!',
      iconPath: 'assets/images/day_20/p1.jpg',
      hrTime: '5:24 AM',
      unreadNum: 642,
      isMuted: true,
      isGroup: true,
      chatMsg: [
        Messages(message: 'Planning for the trip tomorrow?', sender: 'Me'),
        Messages(message: 'Yep, got everything packed!', sender: 'Bestie'),
        Messages(message: 'Can\'t wait!', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Hammy',
      iconPath: 'assets/images/day_20/2.jpg',
      hrTime: '6:29 PM',
      unreadNum: 51,
      chatMsg: [
        Messages(message: 'Where have you been?', sender: 'Hammy'),
        Messages(message: 'Just got caught up with work.', sender: 'Me'),
        Messages(message: 'Let\'s catch up this weekend!', sender: 'Hammy'),
      ],
    ),
    ConvoData(
      convoName: 'James Jok',
      iconPath: 'assets/images/day_20/3.jpg',
      hrTime: '9:00 PM',
      unreadNum: 0,
      chatMsg: [
        Messages(message: 'Did you see the latest movie?', sender: 'James Jok'),
        Messages(message: 'Not yet, is it good?', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Family!',
      iconPath: 'assets/images/day_20/p2.jpg',
      hrTime: '10:19 AM',
      unreadNum: 512,
      isGroup: true,
      chatMsg: [
        Messages(
            message: 'Remember to come home early for dinner.', sender: 'Dad'),
        Messages(message: 'Will do!', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Prof Sheesh',
      iconPath: 'assets/images/day_20/4.jpg',
      hrTime: '2:20 PM',
      unreadNum: 51,
      chatMsg: [
        Messages(
            message: 'Please check the assignment guidelines again.',
            sender: 'Prof Sheesh'),
        Messages(message: 'Got it, thanks for the heads up!', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Timmy Ja',
      iconPath: 'assets/images/day_20/5.jpg',
      hrTime: '2:12 AM',
      unreadNum: 12,
      isMuted: true,
      chatMsg: [
        Messages(message: 'Hey, are you awake?', sender: 'Timmy Ja'),
        Messages(message: 'Yeah, what\'s up?', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Kayden Liew',
      iconPath: 'assets/images/day_20/6.jpg',
      hrTime: '12:51 PM',
      unreadNum: 41,
      chatMsg: [
        Messages(
            message: 'Got the tickets for the concert!', sender: 'Kayden Liew'),
        Messages(message: 'Awesome! Can\'t wait.', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Hila',
      iconPath: 'assets/images/day_20/7.jpg',
      hrTime: '5:12 PM',
      unreadNum: 0,
      chatMsg: [
        Messages(
            message: 'Are we still on for lunch tomorrow?', sender: 'Hila'),
        Messages(message: 'Yes, see you at 1!', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Tony Ton',
      iconPath: 'assets/images/day_20/1.jpg',
      hrTime: '4:51 PM',
      unreadNum: 14,
      chatMsg: [
        Messages(message: 'Hey, long time no see!', sender: 'Tony Ton'),
        Messages(message: 'I know right! Let\'s hang out soon.', sender: 'Me'),
      ],
    ),
    ConvoData(
      convoName: 'Besties Outing!',
      iconPath: 'assets/images/day_20/p1.jpg',
      hrTime: '5:24 AM',
      unreadNum: 642,
      isMuted: true,
      isGroup: true,
      chatMsg: [
        Messages(
            message: 'Guys, we need to finalize the trip!', sender: 'Bestie1'),
        Messages(message: 'I\'m good with anywhere.', sender: 'Bestie2'),
        Messages(message: 'Same here.', sender: 'Me'),
      ],
    ),
    ConvoData(
        convoName: 'Hammy',
        iconPath: 'assets/images/day_20/2.jpg',
        hrTime: '6:29 PM',
        unreadNum: 51,
        chatMsg: [
          Messages(message: 'Hey hows it going', sender: 'Hammy'),
          Messages(message: 'Been a while since we talked!', sender: 'Hammy'),
          Messages(message: 'Not too bad, how bout you?', sender: 'Me')
        ]),
  ];

  List<ConvoData> get convos => _convos;

  void addConvo(ConvoData convo) {
    _convos.add(convo);
    notifyListeners();
  }

  void removeConvo(int idx) {
    _convos.remove(_convos[idx]);
    notifyListeners();
  }

  void swapConvo(int idx) {
    ConvoData tempConvo = _convos[idx];
    _convos.remove(_convos[idx]);
    _convos.insert(0, tempConvo);
    notifyListeners();
  }

  void addMessage(int idx, String msg, String sender) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('h:mm a').format(now);
    print(formattedTime);
    _convos[idx].chatMsg.add(Messages(message: msg, sender: sender));
    notifyListeners();
  }
}

class ConvoData {
  String convoName;
  String iconPath;
  String hrTime;
  int unreadNum;
  bool isMuted, isGroup;
  List<Messages> chatMsg;

  ConvoData(
      {required this.convoName,
      required this.iconPath,
      required this.hrTime,
      required this.unreadNum,
      this.isMuted = false,
      required this.chatMsg,
      this.isGroup = false});
}

class Messages {
  String sender;
  String message;

  Messages({required this.message, required this.sender});
}
