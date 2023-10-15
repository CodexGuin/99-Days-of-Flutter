// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_12/widgets/myListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
                  child: Icon(Icons.favorite, size: 50, color: Colors.white))),
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
                onTap: () {})
          ]))
        ]));
  }
}
