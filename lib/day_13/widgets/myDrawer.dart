// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_13/widgets/myListTile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? logOut;

  const MyDrawer({super.key, this.logOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(children: [
          // * Drawer Header
          const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('[ Username ]',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white))
                ],
              ))),
          // * Drawer Body
          Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
            MyListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => Navigator.pushReplacementNamed(context, '/home')),
            MyListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {}),
            MyListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {}),
            MyListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: logOut)
          ]))
        ]));
  }
}
