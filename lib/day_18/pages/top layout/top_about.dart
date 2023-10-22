// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TopAbout extends StatefulWidget {
  const TopAbout({super.key});

  @override
  State<TopAbout> createState() => _TopAboutState();
}

class _TopAboutState extends State<TopAbout> {
  List<String> tilesOrder = ['run', 'heart', 'code'];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tilesOrder.map((tile) {
              return Flexible(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: DragTarget<String>(
                        builder: (context, accepted, rejected) {
                          return Container(
                            color: Colors.transparent,
                          );
                        },
                        onAccept: (data) {
                          setState(() {
                            int oldIndex = tilesOrder.indexOf(data);
                            int newIndex = tilesOrder.indexOf(tile);
                            if (oldIndex != -1 && newIndex != -1) {
                              String temp = tilesOrder[oldIndex];
                              tilesOrder[oldIndex] = tilesOrder[newIndex];
                              tilesOrder[newIndex] = temp;
                            }
                            print(tilesOrder);
                          });
                        },
                      ),
                    ),
                    Draggable<String>(
                      data: tile,
                      feedback: _buildTile(tile, isDragging: true),
                      childWhenDragging: _buildTile(tile, isPlaceholder: true),
                      child: _buildTile(tile),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(String tile,
      {bool isDragging = false, bool isPlaceholder = false}) {
    Color borderColor;
    IconData iconData;
    if (tile == 'run') {
      borderColor = Colors.green;
      iconData = Icons.directions_run_rounded;
    } else if (tile == 'heart') {
      borderColor = Colors.blue;
      iconData = Icons.favorite_rounded;
    } else if (tile == 'code') {
      borderColor = Colors.red;
      iconData = Icons.code_rounded;
    } else {
      borderColor = Colors.grey;
      iconData = Icons.error;
    }

    return InnerPanel(
      borderColor: borderColor,
      child: Icon(
        iconData,
        color: isDragging ? Colors.white.withOpacity(0.5) : Colors.white,
        size: isPlaceholder ? 0 : 50,
      ),
    );
  }
}

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
