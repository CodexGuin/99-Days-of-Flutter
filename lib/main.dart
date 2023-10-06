import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_2/theme/theme_provider.dart';
import 'package:provider/provider.dart';

// ! Import the main file for the day you want to run.
//import 'day_1/day_1_main.dart';
//import 'day_2/day_2_main.dart';
import 'day_3/day_3_main.dart';

// * Main function after selecting day_x_main file
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MainApp(),
  ));
}
