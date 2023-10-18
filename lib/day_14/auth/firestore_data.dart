// ignore_for_file: avoid_print

/*

  This database stores posts that users have published in the app.
  It is stored in a collection called "Posts" in Firebase

  Each post will contain:
  - A message
  - The user who posted it
  - The date and time it was posted

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabase {
  // Current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // Get collection of posts from Firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  // Post a message
  Future<void> addPost(String message) {
    return posts
        .add({
          'message': message,
          'user': user!.displayName,
          'date': DateTime.now().toString()
        })
        .then((value) => print('Post added'))
        .catchError((error) => print('Failed to add post: $error'));
  }

  // Read posts from database
  Stream<QuerySnapshot> readPosts() {
    return FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('date', descending: true)
        .snapshots();
  }
}
