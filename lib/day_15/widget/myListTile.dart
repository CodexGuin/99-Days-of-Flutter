// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color textColor, iconColor;
  final ValueChanged<String> onTap;

  const MyListTile(
      {super.key,
      required this.text,
      required this.icon,
      required this.textColor,
      required this.iconColor,
      required this.onTap});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> with TickerProviderStateMixin {
  late AnimationController
      _controller; // Animation controller for the color change
  late Animation<Color?> _animation; // Actual color change animation
  final Color _initialColor = Colors.transparent; // Initial color
  final Color _hoverColor = Colors.blueAccent.withOpacity(0.3); // Final color

  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 50), vsync: this);
    _animation =
        ColorTween(begin: _initialColor, end: _hoverColor).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (event) {
          if (!_isSelected) {
            _controller.forward();
          }
        },
        onExit: (event) {
          if (!_isSelected) {
            _controller.reverse();
          }
        },
        child: GestureDetector(
            onTap: () {
              setState(() {
                _isSelected = true;
              });
              widget.onTap(widget.text);
            },
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        color: _isSelected ? _hoverColor : _animation.value,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                        leading: Icon(widget.icon, color: widget.iconColor),
                        title: Text(widget.text,
                            style: TextStyle(
                                color: widget.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 20)))))));
  }
}
