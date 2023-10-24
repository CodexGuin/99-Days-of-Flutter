import 'package:flutter/material.dart';

class TopSettings extends StatefulWidget {
  const TopSettings({super.key});

  @override
  State<TopSettings> createState() => _TopSettingsState();
}

class _TopSettingsState extends State<TopSettings> {
  double _vol = 0.5;

  Color? getColorBasedOnVol() {
    if (_vol < 0.25) {
      // * Between Red and Yellow
      return Color.lerp(
          Colors.red,
          Colors.yellow,
          _vol *
              4); // _vol * 4 because _vol goes from 0 to 0.25 in this section
    } else if (_vol < 0.75) {
      // * Between Yellow and Green
      return Color.lerp(
          Colors.yellow,
          Colors.green,
          (_vol - 0.25) *
              2); // _vol goes from 0.25 to 0.75 in this section, so we subtract 0.25 to start from 0
    } else {
      // * Green
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Volume',
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        letterSpacing: 2,
                        color: Colors.white30,
                        fontSize: 25)),
                const SizedBox(width: 20),
                Text('${(_vol * 100).round()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        letterSpacing: 2,
                        color: Colors.white30,
                        fontSize: 25)),
                const SizedBox(width: 5),
                const Icon(Icons.volume_up, color: Colors.white30),
              ],
            ),
            Slider(
              value: _vol,
              onChanged: (value) {
                setState(() {
                  _vol = value;
                });
              },
              activeColor: getColorBasedOnVol(),
              inactiveColor: Colors.white30,
            ),
          ],
        ),
      ),
    );
  }
}
