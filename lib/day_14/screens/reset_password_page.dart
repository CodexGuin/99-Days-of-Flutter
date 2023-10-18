// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_14/helper/helper_functions.dart';
import 'package:ninety_nine_days_of_flutter/day_14/screens/login_page.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/myButton.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/myTextField.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  // Text Controllers
  final TextEditingController emailController = TextEditingController();

  void resetPassword() async {
    // * Check if email is empty
    if (emailController.text.isEmpty) {
      DisplayMessageToUser('Please enter your email', context);
      return;
    }

    try {
      // * Send password reset email
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      // * Display success message
      await DisplayMessageToUser(
          'Password reset email sent to ${emailController.text}', context);

      // * Optionally navigate back to the login page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (error) {
      // * Display error message
      DisplayMessageToUser(error.toString(), context);
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

          const Text('Reset your password here!',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2)),

          const SizedBox(height: 20),

          // * Email
          MyTextField(
              controller: emailController,
              hintText: 'Email',
              leftPadding: 50,
              rightPadding: 50),

          const SizedBox(height: 20),

          // * Login Button
          MyButton(text: 'Reset Password', onPressed: () => resetPassword())
        ]))));
  }
}
