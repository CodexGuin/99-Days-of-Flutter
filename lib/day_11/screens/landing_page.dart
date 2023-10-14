import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_11/widgets/myButton.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          Image.asset('assets/images/day_5/logo-rmbg.png',
              height: 200, width: 200),
          const SizedBox(height: 50),

          // * App Name
          const Text('CanClimb?',
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2)),

          // * App Description
          const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Text('Yet another community app for climbers.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 15))),

          const SizedBox(height: 30),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // * Login Button
            MyButton(
                height: 40,
                text: 'Login',
                onPressed: () => Navigator.pushNamed(context, '/login')),

            // * Register Button
            MyButton(height: 40, text: 'Register', onPressed: () {})
          ])
        ]))));
  }
}
