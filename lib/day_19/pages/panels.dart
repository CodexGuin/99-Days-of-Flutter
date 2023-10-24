// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/top%20layout/top_about.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/top%20layout/top_contact.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/top%20layout/top_home.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/top%20layout/top_settings.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/bottom%20layout/bottom_about.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/bottom%20layout/bottom_contact.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/bottom%20layout/bottom_home.dart';
import 'package:ninety_nine_days_of_flutter/day_19/pages/bottom%20layout/bottom_settings.dart';
import 'package:ninety_nine_days_of_flutter/day_19/providers/current_action_provider.dart';
import 'package:provider/provider.dart';

class Panel extends StatelessWidget {
  final List<Widget> pages;
  const Panel({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        double screenWidth = screenSize.width;

        double fontSize = screenWidth / 1600 * 25;

        return ValueListenableBuilder<int>(
          valueListenable: Provider.of<CurrentActionProvider>(context)
              .currentIdxListenable(),
          builder: (context, currentIdx, child) {
            List<String> actions = ['Home', 'About', 'Contact', 'Settings'];
            String currentAction = actions[currentIdx];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentAction,
                    style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        letterSpacing: 2,
                        color: Colors.white70,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(height: 20),
                pages[currentIdx],
              ],
            );
          },
        );
      },
    );
  }
}

class TopPanel extends Panel {
  TopPanel({super.key})
      : super(pages: [
          const TopHome(),
          const TopAbout(),
          const TopContact(),
          const TopSettings()
        ]);
}

class BottomPanel extends Panel {
  BottomPanel({super.key})
      : super(pages: [
          const BottomHome(),
          const BottomAbout(),
          const BottomContact(),
          const BottomSettings()
        ]);
}
