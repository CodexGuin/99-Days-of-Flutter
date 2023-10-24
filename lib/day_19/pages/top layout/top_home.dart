import 'package:flutter/material.dart';

class TopHome extends StatelessWidget {
  const TopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * Profile Picture
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: const Color(0xFF0c0c0c),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.white30),
                  SizedBox(height: 5),
                  Text('Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white30,
                          fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // * Salutation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Salutation',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white38,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: const Color(0xFF0c0c0c),
                  icon: const Icon(Icons.arrow_drop_down_sharp,
                      color: Colors.white70),
                  items: const [
                    DropdownMenuItem(
                      value: 'Mr.',
                      child:
                          Text('Mr.', style: TextStyle(color: Colors.white70)),
                    ),
                    DropdownMenuItem(
                      value: 'Mrs.',
                      child:
                          Text('Mrs.', style: TextStyle(color: Colors.white70)),
                    ),
                    DropdownMenuItem(
                      value: 'Ms.',
                      child:
                          Text('Ms.', style: TextStyle(color: Colors.white70)),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    // Handle the selected value here
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
        const Text(
          'Base information',
          style: TextStyle(
              fontSize: 25, color: Colors.white30, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // * Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white38,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.white30),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // * Age
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Age',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white38,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: 'Enter your age',
                      hintStyle: TextStyle(color: Colors.white30),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // * URL
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'URL',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white38,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: 'Enter your URL',
                      hintStyle: TextStyle(color: Colors.white30),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
