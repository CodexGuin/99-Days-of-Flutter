// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_19/providers/top_about_drag_provider.dart';
import 'package:provider/provider.dart';

class TopAbout extends StatefulWidget {
  const TopAbout({super.key});

  @override
  State<TopAbout> createState() => _TopAboutState();
}

class _TopAboutState extends State<TopAbout> {
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                context.watch<TopAboutDragProvider>().getTilesOrder.map((tile) {
              return Flexible(
                child: Stack(
                  children: !isDragging
                      ? [
                          // * When the tile is not being dragged
                          Positioned.fill(
                            child: DragTarget<String>(
                              builder: (context, accepted, rejected) {
                                return Container(
                                  color: Colors.transparent,
                                );
                              },
                              onAccept: (data) {
                                setState(() {
                                  Provider.of<TopAboutDragProvider>(context,
                                          listen: false)
                                      .reorderTiles(data, tile);
                                });
                              },
                            ),
                          ),
                          Draggable<String>(
                            data: tile,
                            onDragStarted: () {
                              setState(() {
                                isDragging = true;
                              });
                            },
                            onDragEnd: (details) {
                              setState(() {
                                print('end');
                                isDragging = false;
                              });
                            },
                            onDragCompleted: () {
                              setState(() {
                                isDragging = false;
                              });
                            },
                            feedback: _buildTile(tile, isDragging: true),
                            childWhenDragging:
                                _buildTile(tile, isPlaceholder: true),
                            child: _buildTile(tile),
                          ),
                        ]
                      : [
                          // * When the tile is being dragged
                          _buildTile(tile, isPlaceholder: true),
                          Positioned.fill(
                            child: DragTarget<String>(
                              builder: (context, accepted, rejected) {
                                return Container(
                                  color: Colors.transparent,
                                );
                              },
                              onAccept: (data) {
                                setState(() {
                                  Provider.of<TopAboutDragProvider>(context,
                                          listen: false)
                                      .reorderTiles(data, tile);
                                });
                              },
                            ),
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
