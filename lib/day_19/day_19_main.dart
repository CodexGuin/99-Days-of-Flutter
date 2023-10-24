import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
