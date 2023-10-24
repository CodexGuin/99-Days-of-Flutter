import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double left, top, bottom, right, borderRadius;
  final Color color;
  final Widget? child;

  const Tile(
      {super.key,
      this.borderRadius = 15,
      this.left = 15,
      this.top = 15,
      this.bottom = 15,
      this.right = 15,
      required this.color,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(
                left: left, top: top, bottom: bottom, right: right),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: child));
  }
}
