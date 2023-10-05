import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Color bgColor;
  final String text;

  const MyButton(
      {super.key,
      required this.onTap,
      required this.bgColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: bgColor),
            child: Align(
                alignment: Alignment.center,
                child: Text(text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    )))));
  }
}
