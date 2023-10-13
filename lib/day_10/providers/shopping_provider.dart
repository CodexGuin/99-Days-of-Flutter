import 'package:flutter/material.dart';

class ShoppingProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Item 1', 'count': 0, 'price': 15.23},
    {'name': 'Item 2', 'count': 0, 'price': 26.42},
    {'name': 'Item 3', 'count': 0, 'price': 32.71},
    {'name': 'Item 4', 'count': 0, 'price': 46.31},
    {'name': 'Item 5', 'count': 0, 'price': 51.89}
  ];

  // * Fold starts with an initial value, in this case 0, which represents the previousValue.
  // * For each element in the cartItems, you're taking the previousValue (which starts at 0) and adding the count of the current element.
  // * The final result, after processing all elements in cartItems, will be the sum of all count values, which is stored in totalItems.
  int get totalItems => cartItems.fold(
      0,
      (int previousValue, Map<String, dynamic> element) =>
          previousValue + element['count'] as int);

  double get totalAmount => cartItems.fold(
      0,
      (double previousValue, Map<String, dynamic> element) =>
          previousValue +
          (element['count'] as int) * (element['price'] as double));

  void increment(int index) {
    if (cartItems[index]['count'] >= 0) {
      cartItems[index]['count']++;
    }
    notifyListeners();
  }

  void decrement(int index) {
    if (cartItems[index]['count'] > 0) {
      cartItems[index]['count']--;
    }
    notifyListeners();
  }

  void clearCart() {
    for (var element in cartItems) {
      element['count'] = 0;
    }
    notifyListeners();
  }
}
