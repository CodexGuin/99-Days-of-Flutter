// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class TopAboutDragProvider extends ChangeNotifier {}

class InnerPanel extends StatelessWidget {
  final Color borderColor;
  final Widget child;

  const InnerPanel({super.key, required this.borderColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2c2c2c),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(child: child),
    );
  }
}
