// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class TopAboutDragProvider extends ChangeNotifier {
  Widget _panelContainer(Color color, String text,
      [bool isPlaceholder = false]) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isPlaceholder ? Colors.grey : color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isPlaceholder
          ? null
          : Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
    );
  }
}
