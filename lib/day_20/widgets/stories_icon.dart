// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StoriesIcon extends StatelessWidget {
  final String imagePath, userName;
  final int index;
  bool isStory;
  double height;

  StoriesIcon({
    super.key,
    required this.imagePath,
    required this.userName,
    required this.index,
    this.height = 100,
    this.isStory = true,
  });

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? // * 1st Photo, myself
        Column(
            children: [
              SizedBox(
                height: height,
                child: Stack(
                  children: [
                    Container(
                      width: 0.8 * height,
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.amber, Colors.red, Colors.pink],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.02 * height),
                        child: Container(
                          width: 0.75 * height,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: Colors.black, width: 0.04 * height)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 0.25 * height,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.add_circle_rounded,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isStory
                  ? Text(
                      'Your story',
                      style: TextStyle(
                          color: Colors.white, fontSize: 0.14 * height),
                    )
                  : const SizedBox.shrink()
            ],
          )
        : // * Everyone else
        Column(
            children: [
              SizedBox(
                height: height,
                child: Container(
                  width: 0.80 * height,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.amber, Colors.red, Colors.pink],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0.02 * height),
                    child: Container(
                      width: 0.75 * height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(imagePath), fit: BoxFit.cover),
                          border: Border.all(
                              color: Colors.black, width: 0.04 * height)),
                    ),
                  ),
                ),
              ),
              isStory
                  ? Text(
                      userName,
                      style: TextStyle(
                          color: Colors.white, fontSize: 0.14 * height),
                    )
                  : const SizedBox.shrink()
            ],
          );
  }
}
