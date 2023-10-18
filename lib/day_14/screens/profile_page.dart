import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_11/widgets/myButton.dart';
import 'package:ninety_nine_days_of_flutter/day_14/helper/helper_functions.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/myDrawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black87),
            title: const Text('Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black87)),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      // Leave as a default user icon for now
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(Icons.person, size: 100)),
                      const SizedBox(height: 20),
                      Text(snapshot.data!.data()!['username'],
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2)),
                      const SizedBox(height: 20),
                      Text(snapshot.data!.data()!['email'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2)),
                      const SizedBox(height: 20),
                      MyButton(
                          text: 'Logout',
                          onPressed: () => logout(context),
                          width: 100)
                    ]));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        drawer: MyDrawer(logOut: () => logout(context)));
  }
}
