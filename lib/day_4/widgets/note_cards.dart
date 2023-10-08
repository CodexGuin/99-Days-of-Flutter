import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteCards extends StatefulWidget {
  bool tl, tr, bl, br;
  final double? height;
  final Color bgColor;
  bool isVertical;
  bool isLeftCard;
  final String noteText;

  NoteCards({
    super.key,
    this.tl = false,
    this.tr = false,
    this.bl = false,
    this.br = false,
    this.height,
    this.isVertical = true,
    this.isLeftCard = true,
    required this.noteText,
    required this.bgColor,
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
              color: widget.bgColor,
              borderRadius: BorderRadius.only(
                  topLeft: widget.tl == false
                      ? const Radius.circular(0)
                      : const Radius.circular(50),
                  topRight: widget.tr == false
                      ? const Radius.circular(0)
                      : const Radius.circular(50),
                  bottomLeft: widget.bl == false
                      ? const Radius.circular(0)
                      : const Radius.circular(50),
                  bottomRight: widget.br == false
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
      ])),

      // * Four corners
      Positioned(
          top: 2,
          left: 4,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.tl == false) {
                    widget.tl = true;
                  } else {
                    widget.tl = false;
                  }
                });
              },
              child:
                  Container(color: Colors.transparent, height: 25, width: 25))),

      Positioned(
          top: 2,
          right: 4,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.tr == false) {
                    widget.tr = true;
                  } else {
                    widget.tr = false;
                  }
                });
              },
              child:
                  Container(color: Colors.transparent, height: 25, width: 25))),

      Positioned(
          bottom: 2,
          left: 4,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.bl == false) {
                    widget.bl = true;
                  } else {
                    widget.bl = false;
                  }
                });
              },
              child:
                  Container(color: Colors.transparent, height: 25, width: 25))),

      Positioned(
          bottom: 2,
          right: 4,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.br == false) {
                    widget.br = true;
                  } else {
                    widget.br = false;
                  }
                });
              },
              child:
                  Container(color: Colors.transparent, height: 25, width: 25))),
    ]));
  }
}
