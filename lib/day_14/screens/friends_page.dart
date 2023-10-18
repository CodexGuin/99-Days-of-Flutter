import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_14/helper/helper_functions.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/myDrawer.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black87),
            title: const Text('Friends',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black87)),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent),
        // * Use a stream builder to get the list of friends
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data == null) {
                return const Center(child: Text('No friends'));
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(snapshot.data!.docs[index]['username']),
                        subtitle: Text(snapshot.data!.docs[index]['email']));
                  });
            }),
        drawer: MyDrawer(logOut: () => logout(context)));
  }
}
