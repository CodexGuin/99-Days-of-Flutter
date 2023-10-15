// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void DisplayMessageToUser(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message)));
}
