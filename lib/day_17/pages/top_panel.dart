import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_17/pages/top%20layout/top_about.dart';
import 'package:ninety_nine_days_of_flutter/day_17/pages/top%20layout/top_contact.dart';
import 'package:ninety_nine_days_of_flutter/day_17/pages/top%20layout/top_home.dart';
import 'package:ninety_nine_days_of_flutter/day_17/pages/top%20layout/top_settings.dart';
import 'package:ninety_nine_days_of_flutter/day_17/providers/current_action_provider.dart';
import 'package:provider/provider.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the screen size
        final screenSize = MediaQuery.of(context).size;
        double screenWidth = screenSize.width;

        // Calculate dynamic font size based on screen size
        double fontSize = screenWidth / 1600 * 25;

        return ValueListenableBuilder<int>(
          valueListenable: Provider.of<CurrentActionProvider>(context)
              .currentIdxListenable(),
          builder: (context, currentIdx, child) {
            // Return current action in string based on current idx
            String currentAction = currentIdx == 0
                ? 'Home'
                : currentIdx == 1
                    ? 'About'
                    : currentIdx == 2
                        ? 'Contact'
                        : 'Settings';

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
                currentIdx == 0
                    ? const TopHome()
                    : currentIdx == 1
                        ? const TopAbout()
                        : currentIdx == 2
                            ? const TopContact()
                            : const TopSettings(),
              ],
            );
          },
        );
      },
    );
  }
}
