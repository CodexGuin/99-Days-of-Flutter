// ignore_for_file: file_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/myListTile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? logOut;

  MyDrawer({super.key, this.logOut});

  User? user = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(children: [
          // * Drawer Header
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Icon(Icons.favorite, size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(user!.displayName!,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.white))
                  ]))),
          // * Drawer Body
          Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
            MyListTile(
                leading: const Icon(Icons.home),
                title: const Text('H o m e'),
                onTap: () => Navigator.pushReplacementNamed(context, '/home')),
            MyListTile(
                leading: const Icon(Icons.person),
                title: const Text('P r o f i l e'),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/profile')),
            MyListTile(
                leading: const Icon(Icons.group),
                title: const Text('F r i e n d s'),
                onTap: () => Navigator.pushReplacementNamed(
                    context, '/friends')), // * Add this line
            MyListTile(
                leading: const Icon(Icons.settings),
                title: const Text('S e t t i n g s'),
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: const Text('Coming soon!'),
                            content: const Text('This feature is coming soon!'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ]))),
            MyListTile(
                leading: const Icon(Icons.logout),
                title: const Text('L o g o u t'),
                onTap: logOut)
          ]))
        ]));
  }
}
