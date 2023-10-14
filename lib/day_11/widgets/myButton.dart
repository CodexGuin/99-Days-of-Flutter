import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width, height;
  final Function onPressed;
  final String text;

  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = 150,
      this.height = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            onPressed: () => onPressed(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge)));
  }
}
