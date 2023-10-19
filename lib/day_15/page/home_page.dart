import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_15/widget/myListTile.dart';
import 'package:ninety_nine_days_of_flutter/day_15/widget/main_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedTile = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0c0c0c),
        body: Row(children: [
          Flexible(
              flex: 1,
              child: MainTile(
                  margin: const EdgeInsets.only(
                      left: 15, top: 15, bottom: 15, right: 7.5),
                  color: const Color(0xFF2c2c2c),
                  child: Center(
                      child: Column(children: [
                    const SizedBox(height: 15),
                    const Image(
                        image: AssetImage('assets/images/day_5/logo-rmbg.png'),
                        height: 75,
                        width: 75),
                    const Text('C a n C l i m b',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 20)),
                    const SizedBox(height: 15),
                    MyListTile(
                        text: 'Home',
                        icon: Icons.home,
                        textColor: Colors.white70,
                        iconColor: Colors.white70,
                        onTap: (tileText) {
                          setState(() {
                            _selectedTile = tileText;
                          });
                        }),
                    MyListTile(
                        text: 'About',
                        icon: Icons.info,
                        textColor: Colors.white70,
                        iconColor: Colors.white70,
                        onTap: (tileText) {
                          setState(() {
                            _selectedTile = tileText;
                          });
                        }),
                    MyListTile(
                        text: 'Contact',
                        icon: Icons.contact_mail,
                        textColor: Colors.white70,
                        iconColor: Colors.white70,
                        onTap: (tileText) {
                          setState(() {
                            _selectedTile = tileText;
                          });
                        }),
                    MyListTile(
                        text: 'Settings',
                        icon: Icons.settings,
                        textColor: Colors.white70,
                        iconColor: Colors.white70,
                        onTap: (tileText) {
                          setState(() {
                            _selectedTile = tileText;
                          });
                        })
                  ])))),
          Flexible(
              flex: 5,
              child: Column(children: [
                Flexible(
                    child: MainTile(
                        margin: const EdgeInsets.only(
                            top: 15, bottom: 7.5, right: 15, left: 7.5),
                        color: const Color(0xFF1a1a1a),
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          double containerWidth = constraints.maxWidth / 3 -
                              40; // considering 20 as margin from left and right for each container
                          double containerHeight = constraints.maxHeight / 2 -
                              30; // considering 15 as margin from top and bottom for each container

                          return Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                const Align(
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 15),
                                        child: Text('Home',
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 30)))),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: containerHeight,
                                          width: containerWidth,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF2c2c2c),
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      Container(
                                          height: containerHeight,
                                          width: containerWidth,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF2c2c2c),
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      Container(
                                          height: containerHeight,
                                          width: containerWidth,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF2c2c2c),
                                              borderRadius:
                                                  BorderRadius.circular(20)))
                                    ])
                              ]));
                        }))),
                const Flexible(
                    child: MainTile(
                        margin: EdgeInsets.only(
                            top: 7.5, bottom: 15, right: 15, left: 7.5),
                        color: Color(0xFF1a1a1a),
                        child: Center(child: Column(children: []))))
              ]))
        ]));
  }
}
