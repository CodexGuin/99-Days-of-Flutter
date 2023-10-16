// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_13/helper/helper_functions.dart';
import 'package:ninety_nine_days_of_flutter/day_13/widgets/myButton.dart';
import 'package:ninety_nine_days_of_flutter/day_13/widgets/myTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // * Email validation (Regex, local check before sending to Firebase)
  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  void register() async {
    // * Show loading dialog
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
      barrierDismissible:
          false, // prevent user from dismissing by tapping outside
    );

    // * Ensure all fields are filled
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      // * Hide loading dialog
      Navigator.pop(context);

      // * Show error dialog
      DisplayMessageToUser('Please fill in all fields!', context);
      return; // Stop further execution
    }

    // * Ensure password and confirm password matches
    if (passwordController.text != confirmPasswordController.text) {
      // * Hide loading dialog
      Navigator.pop(context);

      // * Show error dialog
      DisplayMessageToUser('Password doesn\'t match!', context);
      return; // Stop further execution
    }

    // * Try to register user
    try {
      // * Create user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      // * Add username to user
      await userCredential.user!.updateDisplayName(usernameController.text);

      // * Hide loading dialog
      Navigator.pop(context);

      // * Show success dialog
      DisplayMessageToUser('Registration successful!', context);
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

          const Text('Registration',
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2)),

          const SizedBox(height: 20),

          // * Username
          MyTextField(
              controller: usernameController,
              hintText: 'Username',
              leftPadding: 50,
              rightPadding: 50),

          const SizedBox(height: 10),

          // * Email
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

          const SizedBox(height: 10),

          // * Confirm Password
          MyTextField(
              controller: confirmPasswordController,
              obscureText: true,
              hintText: 'Confirm Password',
              leftPadding: 50,
              rightPadding: 50),

          const SizedBox(height: 20),

          // * Login Button
          MyButton(text: 'Register', onPressed: () => register())
        ]))));
  }
}
