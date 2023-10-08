// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_5/widgets/FrostedGlassBox.dart';
import 'package:stroke_text/stroke_text.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/day_5/backgroundImage_3.jpg'),
                    fit: BoxFit.cover)),
            alignment: Alignment.center,
            child: FrostedGlassBox(
                height: 550,
                width: 300,
                borderOpacity: 0.7,
                bgOpacityOne: 0.25,
                bgOpacityTwo: 0.25,
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(15),
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/day_5/logo-rmbg.png')))),
                  const StrokeText(
                      text: 'CanClimb',
                      textStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(height: 10),
                  const SizedBox(
                      width: 200,
                      child: Text(
                          'Ready to discover a slew of SG bouldering utilities?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400))),
                  const SizedBox(height: 20),
                  FrostedGlassBox(
                      height: 50,
                      width: 250,
                      radius: 10,
                      borderOpacity: 0.5,
                      child: Container(
                          padding: const EdgeInsets.only(top: 3),
                          child: const TextField(
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.black54),
                                  hintText: 'Username',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)))))),
                  const SizedBox(height: 20),
                  FrostedGlassBox(
                      height: 50,
                      width: 250,
                      radius: 10,
                      borderOpacity: 0.5,
                      child: Container(
                          padding: const EdgeInsets.only(top: 3),
                          child: const TextField(
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_open_rounded,
                                      color: Colors.black54),
                                  hintText: 'Password',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)))))),
                  const SizedBox(height: 25),
                  GestureDetector(
                      // todo: Authenticate with Firebase
                      onTap: () => print('Login with Firebase Auth'),
                      child: FrostedGlassBox(
                          height: 50,
                          width: 100,
                          radius: 20,
                          bgColorOne: Colors.pink.shade300,
                          bgColorTwo: Colors.pink.shade800,
                          bgOpacityOne: 0.7,
                          bgOpacityTwo: 0.3,
                          child: const Text('Login',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18)))),
                  const SizedBox(height: 15),
                  GestureDetector(
                      // todo: Firebase
                      onTap: () => print('Reset with Firebase Auth'),
                      child: const Text('Forgot username / password?',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 12)))
                ]))));
  }
}
