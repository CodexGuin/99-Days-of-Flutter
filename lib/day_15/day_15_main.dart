import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_15/page/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
