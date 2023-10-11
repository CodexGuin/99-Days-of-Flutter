// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NearestStop extends StatelessWidget {
  const NearestStop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Nearest Bus Stop'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black87));
  }
}
