import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_12/widgets/myDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Logout Function
  void logout() {
    FirebaseAuth.instance.signOut();
    // * Navigate to login page
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black87),
            title: const Text('CanClimb',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black87)),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent,
            actions: [
              IconButton(onPressed: logout, icon: const Icon(Icons.logout))
            ]),
        drawer: const MyDrawer());
  }
}
