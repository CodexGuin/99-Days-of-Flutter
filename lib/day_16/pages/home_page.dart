import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_16/pages/top_panel.dart';
import 'package:ninety_nine_days_of_flutter/day_16/providers/current_action_provider.dart';
import 'package:ninety_nine_days_of_flutter/day_16/widgets/list_tiles.dart';
import 'package:ninety_nine_days_of_flutter/day_16/widgets/tiles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    // Calculate dynamic font size based on screen size
    double fontSize = screenWidth / 1600 * 25;

    return Scaffold(
      backgroundColor: const Color(0xFF0c0c0c),
      body: Center(
        child: Row(
          children: [
            // * Left bar
            Flexible(
              child: Tile(
                color: const Color(0xFF2c2c2c),
                right: 7.5,
                child: Center(
                  child: Column(
                    children: [
                      // * Logo
                      Container(
                          height: fontSize * 5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/day_5/logo-rmbg.png')))),

                      const SizedBox(height: 15),

                      // Use layout builder to get width of parent
                      LayoutBuilder(builder: (context, constraints) {
                        // Show title if width is greater than 178
                        bool showTitle = constraints.maxWidth >= 178;

                        return Column(
                          children: [
                            // * Home
                            MListTile(
                              leading: Icons.home,
                              title: showTitle ? 'Home' : null,
                              onTap: () {
                                Provider.of<CurrentActionProvider>(context,
                                        listen: false)
                                    .setCurrentIdx(0);
                              },
                              index: 0,
                            ),
                            SizedBox(height: showTitle ? 10 : 30),

                            // * About
                            MListTile(
                              leading: Icons.info,
                              title: showTitle ? 'About' : null,
                              onTap: () {
                                Provider.of<CurrentActionProvider>(context,
                                        listen: false)
                                    .setCurrentIdx(1);
                              },
                              index: 1,
                            ),
                            SizedBox(height: showTitle ? 10 : 30),

                            // * Contact
                            MListTile(
                              leading: Icons.contact_page,
                              title: showTitle ? 'Contact' : null,
                              onTap: () {
                                Provider.of<CurrentActionProvider>(context,
                                        listen: false)
                                    .setCurrentIdx(2);
                              },
                              index: 2,
                            ),
                            SizedBox(height: showTitle ? 10 : 30),

                            // * Settings
                            MListTile(
                              leading: Icons.settings,
                              title: showTitle ? 'Settings' : null,
                              onTap: () {
                                Provider.of<CurrentActionProvider>(context,
                                        listen: false)
                                    .setCurrentIdx(3);
                              },
                              index: 3,
                            ),
                          ],
                        );
                      }),

                      // * Spacer
                      const Spacer(),

                      // * Bottom text
                      Text('© 2023 ClimbHaven',
                          style: TextStyle(
                              color: Colors.white38,
                              fontWeight: FontWeight.w700,
                              fontSize: fontSize / 2,
                              letterSpacing: 2))
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  // * Top bar
                  Flexible(
                    child: Tile(
                      color: const Color(0xFF1a1a1a),
                      left: 7.5,
                      bottom: 7.5,
                      child: Center(
                        child: Container(
                          //color: Colors.amber.withOpacity(0.05), // * Debug
                          child: const Center(
                            child: TopPanel(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // * Bottom bar
                  Flexible(
                    child: Tile(
                      color: const Color(0xFF1a1a1a),
                      left: 7.5,
                      top: 7.5,
                      child: Center(
                        child: Container(
                          // color: Colors.amber.withOpacity(0.05), // * Debug
                          child: const Center(
                            child: Text(
                              'Bottom',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
