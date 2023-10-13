import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  int val;
  CounterProvider({this.val = 0});

  void increment() {
    val++;
    notifyListeners();
  }

  void decrement() {
    val--;
    notifyListeners();
  }
}
