// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_12/helper/helper_functions.dart';
import 'package:ninety_nine_days_of_flutter/day_12/screens/home_page.dart';
import 'package:ninety_nine_days_of_flutter/day_12/widgets/myButton.dart';
import 'package:ninety_nine_days_of_flutter/day_12/widgets/myTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() async {
    // * Ensure all fields are filled
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // * Show error dialog
      DisplayMessageToUser('Please fill in all fields!', context);
      return; // Stop further execution
    }

    // * Show loading dialog
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
      barrierDismissible:
          false, // prevent user from dismissing by tapping outside
    );

    try {
      // * Login user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // * Success message
      DisplayMessageToUser('Login successful!', context);

      // * Hide loading dialog
      Navigator.pop(context);

      // * Navigate to home page and clear all previous routes
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      // * Hide loading dialog
      Navigator.pop(context);

      // * Show error dialog
      DisplayMessageToUser(e.message!, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_rounded,
                    color: Colors.black.withOpacity(0.5)))),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          Image.asset('assets/images/day_5/logo-rmbg.png',
              height: 200, width: 200),

          const SizedBox(height: 20),

          const Text('Welcome back!',
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2)),

          const SizedBox(height: 20),

          // * Username
          MyTextField(
              controller: emailController,
              hintText: 'Email',
              leftPadding: 50,
              rightPadding: 50),

          const SizedBox(height: 10),

          // * Password
          MyTextField(
              controller: passwordController,
              obscureText: true,
              hintText: 'Password',
              leftPadding: 50,
              rightPadding: 50),

          const SizedBox(height: 20),

          // * Login Button
          MyButton(text: 'Login', onPressed: () => login())
        ]))));
  }
}
