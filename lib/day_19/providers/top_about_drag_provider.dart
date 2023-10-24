// ignore_for_file: unused_element, avoid_print

import 'package:flutter/material.dart';

class TopAboutDragProvider extends ChangeNotifier {
  List<String> tilesOrder = ['run', 'heart', 'code'];

  // Return tilesOrder
  List<String> get getTilesOrder => tilesOrder;

  void reorderTiles(String data, String tile) {
    int oldIndex = tilesOrder.indexOf(data);
    int newIndex = tilesOrder.indexOf(tile);
    if (oldIndex != -1 && newIndex != -1) {
      String temp = tilesOrder[oldIndex];
      tilesOrder[oldIndex] = tilesOrder[newIndex];
      tilesOrder[newIndex] = temp;
    }
    print(tilesOrder);
    notifyListeners();
  }
}
