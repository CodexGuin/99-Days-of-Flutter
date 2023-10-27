// * Main packages
//import 'dart:io';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:ninety_nine_days_of_flutter/day_19/providers/top_about_drag_provider.dart';
//import 'package:window_manager/window_manager.dart';

// * Firebase
//import 'package:ninety_nine_days_of_flutter/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';

// * Providers
//import 'package:provider/provider.dart';
//import 'package:ninety_nine_days_of_flutter/day_19/providers/current_action_provider.dart';
//import 'package:ninety_nine_days_of_flutter/day_2/theme/theme_provider.dart';

// ! Import the main file for the day you want to run.
import 'day_21/day_21_main.dart';

// * Modify as needed
void main() async {
  runApp(
    /* MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentActionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TopAboutDragProvider(),
        ),
      ], */
    /* child:  */ const MainApp(),
    //),
  );

  /*
  // * If system is not desktop, run the app normally
  if (!kIsWeb &&
      !Platform.isWindows &&
      !Platform.isLinux &&
      !Platform.isMacOS) {
    runApp(const MainApp());
  } else {
    // * If system is desktop, run the app in a window
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowOptions windowOp = const WindowOptions(
        center: true,
        // Start with a 16:9 aspect ratio
        size: Size(1280, 720),
        minimumSize: Size(1000, 600),
        maximumSize: Size(1500, 1000),
        title: '99 Days of Flutter');
    windowManager.waitUntilReadyToShow(windowOp, () {
      runApp(const MainApp());
    });
  } */
}
