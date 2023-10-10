import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_7/pages/nearestStop_page.dart';
import 'package:ninety_nine_days_of_flutter/day_7/pages/search_page.dart';
import 'package:ninety_nine_days_of_flutter/day_7/widgets/FrostedGlassBox.dart';
import 'package:stroke_text/stroke_text.dart';

class HomeScreen extends StatelessWidget {
  final List<String> pagesName = [
    'Nearest Stop',
    'Search',
    'MRT Map',
    'Placeholder'
  ];

  final List<String> pagesImage = [
    'assets/images/day_7/nearestBusStop.png',
    'assets/images/day_7/searchBusStop.png',
    'assets/images/day_7/mrtMap.png',
    'assets/images/day_7/nearestBusStop.png'
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/day_7/bg_3.png'),
                    fit: BoxFit.cover)),
            child: FrostedGlassBox(
                bgOpacityOne: 0.00,
                bgOpacityTwo: 0.00,
                blurX: 1.5,
                blurY: 1.5,
                child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const StrokeText(
                              text: 'SG Bus Boi',
                              strokeColor: Colors.black87,
                              strokeWidth: 5,
                              textStyle: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                          const SizedBox(height: 10),
                          const StrokeText(
                              text: 'What would you like to do?',
                              strokeColor: Colors.black87,
                              strokeWidth: 3,
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                          const SizedBox(height: 50),
                          SizedBox(
                              height: 500,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(children: [
                                      OptionSelector(
                                          option: pagesName[0],
                                          imageName: pagesImage[0],
                                          pageToGo: const NearestStop()),
                                      OptionSelector(
                                          option: pagesName[1],
                                          imageName: pagesImage[1],
                                          pageToGo: const SearchPage())
                                    ]),
                                    Row(children: [
                                      OptionSelector(
                                          option: pagesName[2],
                                          imageName: pagesImage[2],
                                          pageToGo: const SearchPage()),
                                      OptionSelector(
                                          option: pagesName[3],
                                          imageName: pagesImage[3],
                                          pageToGo: const SearchPage())
                                    ])
                                  ]))
                        ])))));
  }
}

class OptionSelector extends StatelessWidget {
  final String option;
  final String imageName;
  final Widget pageToGo;

  const OptionSelector(
      {super.key,
      required this.option,
      required this.imageName,
      required this.pageToGo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          pageToGo,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = 0.0;
                        const end = 1.0;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var opacityAnimation = animation.drive(tween);
                        return FadeTransition(
                            opacity: opacityAnimation, child: child);
                      }));
            },
            child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(children: [
                  // Blur effect
                  Positioned.fill(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                              child: Container(
                                  color: Colors.black.withOpacity(0.5))))),
                  // Content
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(option,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.greenAccent),
                            textAlign: TextAlign.center),
                        Image(image: AssetImage(imageName), color: Colors.green)
                      ])
                ]))));
  }
}
