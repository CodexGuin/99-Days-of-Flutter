import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/friends_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/landing_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/login_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/profile_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/register_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/reset_password_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/themes/dark_mode.dart';
import 'package:ninety_nine_days_of_flutter/day_14/themes/light_mode.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/home_page.dart';

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
          '/resetPassword': (context) => const ResetPasswordPage(),
          '/profile': (context) => const ProfilePage(),
          '/friends': (context) => const FriendsPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        home: const LandingPage());
  }
}
