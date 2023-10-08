// ignore_for_file: file_names
import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  final double width, height, radius, borderOpacity, bgOpacityOne, bgOpacityTwo;
  final Widget child;
  final Color borderColor, bgColorOne, bgColorTwo;

  const FrostedGlassBox(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      this.radius = 30,
      this.borderOpacity = 0.10,
      this.borderColor = Colors.white,
      this.bgColorOne = Colors.white,
      this.bgColorTwo = Colors.white,
      this.bgOpacityOne = 0.08,
      this.bgOpacityTwo = 0.05});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
            height: height,
            width: width,
            color: Colors.transparent,
            child: Stack(children: [
              // Blur effect (bottom most)
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container()),
              // Gradient effect (middle)
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(
                          color: borderColor.withOpacity(borderOpacity)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            bgColorOne.withOpacity(bgOpacityOne),
                            bgColorTwo.withOpacity(bgOpacityTwo)
                          ]))),
              // Child (top most)
              Center(child: child)
            ])));
  }
}
