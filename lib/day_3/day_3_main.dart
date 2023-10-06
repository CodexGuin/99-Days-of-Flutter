import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_3/widgets/note_cards.dart';
import 'package:ninety_nine_days_of_flutter/day_3/widgets/tag_selector.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // * List of tags
  final Map<String, int> tagNotifMap = {
    'All': 23,
    'Important': 5,
    'To-do': 2,
    'Family': 16,
    'Friends': 5,
    'Groceries': 2,
    'School': 3
  };

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0b0f0d),
        body: SafeArea(
            child: ListView(children: [
          // * Top text
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My',
                    style: TextStyle(
                        color: Color(0xFFdddd3c),
                        fontSize: 75,
                        fontWeight: FontWeight.w300)),
                Text('Notes',
                    style: TextStyle(
                        color: Color(0xFFdddd3c),
                        fontSize: 75,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
          // * Tag bar
          SizedBox(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagNotifMap.length,
                  itemBuilder: (context, index) {
                    final key = tagNotifMap.keys.elementAt(index);
                    final val = tagNotifMap[key];
                    return TagSelector(tag: key, numNotif: val!);
                  })),
          // * Cards
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NoteCards(
                    noteText: 'Have to get some bananas', tr: true, bl: true),
                NoteCards(
                    noteText: 'Reminder to fetch lil boi from school',
                    isLeftCard: false,
                    tl: true,
                    tr: true,
                    bl: true)
              ]),
          NoteCards(
              noteText: 'This is a test to lorem ipsum',
              isVertical: false,
              tl: true,
              tr: true,
              br: true),
          NoteCards(
              noteText:
                  'Hey this is a pretty intertersting concept and design, how did I do this?!?!',
              isVertical: false,
              tl: true,
              bl: true,
              br: true)
        ])));
  }
}
