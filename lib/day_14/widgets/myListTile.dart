// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final void Function()? onTap;
  final Widget leading;
  final Widget title;

  const MyListTile(
      {super.key, this.onTap, required this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: leading, title: title, onTap: onTap);
  }
}
