import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final double leftPadding, rightPadding, topPadding, bottomPadding;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const MyTextField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.hintText,
      this.leftPadding = 0,
      this.rightPadding = 0,
      this.topPadding = 0,
      this.bottomPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: leftPadding,
            right: rightPadding,
            top: topPadding,
            bottom: bottomPadding),
        child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)))));
  }
}
