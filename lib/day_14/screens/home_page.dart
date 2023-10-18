import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_11/widgets/myTextField.dart';
import 'package:ninety_nine_days_of_flutter/day_14/auth/firestore_data.dart';
import 'package:ninety_nine_days_of_flutter/day_14/helper/helper_functions.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/myDrawer.dart';
import 'package:ninety_nine_days_of_flutter/day_14/widgets/postButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController newPostController = TextEditingController();
  final FirebaseDatabase database = FirebaseDatabase();

  void postMessage() {
    // Only post if there is text
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    // Clear text field
    newPostController.clear();
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
            backgroundColor: Colors.deepPurpleAccent),
        body: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyTextField(
                            controller: newPostController,
                            hintText: 'How was the climb?'))),
                PostButton(onTap: postMessage)
              ]),

          // * Use a stream builder to get the list of posts
          StreamBuilder(
              stream: database.readPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data == null) {
                  return const Center(child: Text('No posts'));
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: const Icon(Icons.person),
                              title:
                                  Text(snapshot.data!.docs[index]['message']),
                              subtitle:
                                  Text(snapshot.data!.docs[index]['user']),
                              // Format date to only show the date and time in hours and minutes
                              trailing: Text(snapshot.data!.docs[index]['date']
                                  .toString()
                                  .substring(0, 16)));
                        }));
              })
        ]),
        drawer: MyDrawer(logOut: () => logout(context)));
  }
}
