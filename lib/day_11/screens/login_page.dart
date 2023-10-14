// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_11/widgets/myButton.dart';
import 'package:ninety_nine_days_of_flutter/day_11/widgets/myTextField.dart';

class LoginPage extends StatelessWidget {
  // Text Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void login() {
    print('Username: ${usernameController.text}');
    print('Password: ${passwordController.text}');
  }

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
          const Text('CanClimb?',
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 50),

          // * Username
          MyTextField(
              controller: usernameController,
              hintText: 'Username',
              leftPadding: 50,
              rightPadding: 50),
          const SizedBox(height: 20),

          // * Password
          MyTextField(
              controller: passwordController,
              obscureText: true,
              hintText: 'Password',
              leftPadding: 50,
              rightPadding: 50),

          // * Forgot password
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                onPressed: () {},
                child: Text('Forgot Password?',
                    style: Theme.of(context).textTheme.bodyLarge)),
            const SizedBox(width: 50)
          ]),

          // * Login Button
          MyButton(text: 'Login', onPressed: () => login())
        ]))));
  }
}
