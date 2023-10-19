import 'package:flutter/material.dart';

class MainTile extends StatelessWidget {
  final EdgeInsets margin;
  final Color color;
  final double borderRadius;
  final Widget? child;

  const MainTile({
    super.key,
    required this.margin,
    required this.color,
    this.borderRadius = 20,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(child: child));
  }
}
