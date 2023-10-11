// ignore_for_file: file_names
import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  final double radius, borderOpacity, bgOpacityOne, bgOpacityTwo, blurX, blurY;
  final double? width, height;
  final Widget child;
  final Color borderColor, bgColorOne, bgColorTwo;

  const FrostedGlassBox(
      {super.key,
      this.height,
      this.width,
      this.radius = 30,
      this.borderOpacity = 0.10,
      this.borderColor = Colors.white,
      this.bgColorOne = Colors.white,
      this.bgColorTwo = Colors.white,
      this.bgOpacityOne = 0.08,
      this.bgOpacityTwo = 0.05,
      this.blurX = 4,
      this.blurY = 4,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.transparent),
        child: Stack(children: [
          // Blur effect (bottom most)
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Colors.transparent))),
          // Gradient effect (middle)
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  border:
                      Border.all(color: borderColor.withOpacity(borderOpacity)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        bgColorOne.withOpacity(bgOpacityOne),
                        bgColorTwo.withOpacity(bgOpacityTwo)
                      ]))),
          // Child (top most)
          Center(child: child)
        ]));
  }
}
