import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}

// Since we're only working on a simple app this time, well do everything on this file
class MyApp extends StatelessWidget {
  // * List of image path
  final List<String> promoImagePaths = [
    'assets/images/day_1/1.jpg',
    'assets/images/day_1/2.jpg',
    'assets/images/day_1/3.jpg',
    'assets/images/day_1/4.jpg',
    'assets/images/day_1/5.jpg'
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                // ignore: avoid_print
                onPressed: () => print('Menu button~'),
                icon: const Icon(Icons.menu_rounded, color: Colors.black)),
            centerTitle: true,
            title: const Text(
              'Home',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
            )),
        body: SafeArea(
            child: ListView(children: [
          // * First box
          Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 5, left: 10, right: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Find your', style: TextStyle(fontSize: 25)),
                    SizedBox(height: 10),
                    Text('Perfect shoe',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold))
                  ])),
          // * Search box
          Container(
              margin:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '\'Alphafly 4\'',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ))),
          // * Horizontal listview product showcase
          Container(
              margin:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Today\'s special',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 15),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          promoImagePaths.length, // Total number of items
                      itemBuilder: (BuildContext context, int index) {
                        return PromoBox(imagePath: promoImagePaths[index]);
                      },
                    ))
                  ])),
          // * Final image, view more
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/day_1/6.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  height: 200,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                                0.0,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.1)
                              ])),
                      child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'View more',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ))))))
        ])));
  }
}

// * Promo boxes
class PromoBox extends StatelessWidget {
  final String imagePath;

  const PromoBox({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.62 / 3,
        child: Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imagePath))),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: const [
                        0.1,
                        0.9
                      ],
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.1)
                      ])),
            )));
  }
}
