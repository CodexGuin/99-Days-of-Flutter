import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_2/theme/theme_provider.dart';
import 'package:ninety_nine_days_of_flutter/day_2/widgets/my_button.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text('Theme Changer',
                style: TextStyle(fontWeight: FontWeight.w300))),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 5, left: 10, right: 10),
                  padding: const EdgeInsets.all(5),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15)),
                  child: MyButton(
                      onTap: () =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                      bgColor: Theme.of(context).colorScheme.secondary,
                      text: 'Tap to change theme!'))
            ])));
  }
}
