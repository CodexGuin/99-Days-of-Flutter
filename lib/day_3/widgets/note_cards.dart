import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class NoteCards extends StatefulWidget {
  final bool? tl, tr, bl, br;
  final double? height;
  bool isVertical;
  bool isLeftCard;
  final String noteText;

  NoteCards({
    super.key,
    this.tl,
    this.tr,
    this.bl,
    this.br,
    this.height,
    this.isVertical = true,
    this.isLeftCard = true,
    required this.noteText,
  });

  @override
  State<NoteCards> createState() => _NoteCardsState();
}

class _NoteCardsState extends State<NoteCards>
    with SingleTickerProviderStateMixin {
  bool _isFav = false;

  @override
  void initState() {
    super.initState();
  }

  final List<Color> noteCardsColor = [
    const Color(0xFFeb7a53),
    const Color(0xFFf7d44c),
    const Color(0xFFf6ecc9),
    const Color(0xFF98b7db),
    const Color(0xFFa8d672)
  ];

  Color getRandomColor() {
    final random = Random();
    return noteCardsColor[random.nextInt(noteCardsColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      Container(
          height: widget.isVertical ? 300 : 150,
          margin: EdgeInsets.only(
              left: (widget.isLeftCard && widget.isVertical) ? 4 : 2,
              right: (!widget.isLeftCard && widget.isVertical) ? 4 : 2,
              top: 2,
              bottom: 2),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          decoration: BoxDecoration(
              color: getRandomColor(),
              borderRadius: BorderRadius.only(
                  topLeft: widget.tl == null
                      ? const Radius.circular(0)
                      : const Radius.circular(50),
                  topRight: widget.tr == null
                      ? const Radius.circular(0)
                      : const Radius.circular(50),
                  bottomLeft: widget.bl == null
                      ? const Radius.circular(0)
                      : const Radius.circular(50),
                  bottomRight: widget.br == null
                      ? const Radius.circular(0)
                      : const Radius.circular(50))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text('Groceries this weekend',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20)))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFav = !_isFav; // Toggle the _isFav value
                        });
                      },
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          child: _isFav
                              ? const Icon(Icons.favorite,
                                  key: ValueKey<int>(1), size: 30)
                              : const Icon(Icons.favorite_border,
                                  key: ValueKey<int>(2), size: 30)))
                ]),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('Updated 10 min ago',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 10))),
                Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(widget.noteText,
                        style: TextStyle(color: Colors.grey.shade900)))
              ])),
      // * The cool looking double bar at the top of each note
      Center(
          child: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 8),
            width: 20,
            height: 1,
            color: Colors.black),
        Container(
            margin: const EdgeInsets.only(top: 2),
            width: 8,
            height: 1,
            color: Colors.black)
      ]))
    ]));
  }
}
