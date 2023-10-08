import 'package:flutter/material.dart';

class TagSelector extends StatefulWidget {
  final String tag;
  final int numNotif;

  const TagSelector({super.key, required this.tag, required this.numNotif});

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector>
    with SingleTickerProviderStateMixin {
  bool _isSelected = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    _colorAnimation =
        ColorTween(begin: Colors.white, end: const Color(0xFFdddd3c))
            .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_isSelected) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          _isSelected = !_isSelected;
          // ignore: avoid_print
          print(widget.tag);
        },
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(
                    color: _colorAnimation.value ??
                        Colors.white // Color when selected: Blue, else: White
                    )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.tag,
                      style: TextStyle(
                          color: _colorAnimation.value ?? Colors.white,
                          fontSize:
                              20) // Use the conditional operator to decide the text color based on the selection status
                      ),
                  widget.numNotif == 0
                      ? const SizedBox.shrink()
                      : NumTag(num: widget.numNotif)
                ])));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class NumTag extends StatelessWidget {
  final int num;
  const NumTag({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 10, right: 5),
        height: 26,
        width: 26,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.grey.shade800),
        child: Center(
            child: Text(num.toString(),
                style: const TextStyle(color: Colors.white))));
  }
}
