import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_13/screens/landing_page.dart';
import 'package:ninety_nine_days_of_flutter/day_13/screens/login_page.dart';
import 'package:ninety_nine_days_of_flutter/day_13/screens/register_page.dart';
import 'package:ninety_nine_days_of_flutter/day_13/screens/reset_password_page.dart';
import 'package:ninety_nine_days_of_flutter/day_13/themes/dark_mode.dart';
import 'package:ninety_nine_days_of_flutter/day_13/themes/light_mode.dart';
import 'package:ninety_nine_days_of_flutter/day_13/screens/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/resetPassword': (context) => const ResetPasswordPage()
        },
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        home: const LandingPage());
  }
}
