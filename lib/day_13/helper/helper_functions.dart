// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Future<void> DisplayMessageToUser(String message, BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(message)]),
              actions: [
                TextButton(
                    child: const Center(
                        child: Text('OK',
                            style: TextStyle(color: Colors.black87))),
                    onPressed: () {
                      Navigator.of(context).pop(); // dismiss the dialog
                    })
              ]));
}
