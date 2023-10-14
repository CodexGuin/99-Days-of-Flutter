import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_11/screens/landing_page.dart';
import 'package:ninety_nine_days_of_flutter/day_11/screens/login_page.dart';
import 'package:ninety_nine_days_of_flutter/day_11/themes/dark_mode.dart';
import 'package:ninety_nine_days_of_flutter/day_11/themes/light_mode.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {'/login': (context) => LoginPage()},
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        home: const LandingPage());
  }
}
