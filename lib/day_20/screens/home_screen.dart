import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninety_nine_days_of_flutter/day_20/data/image_data.dart';
import 'package:ninety_nine_days_of_flutter/day_20/widgets/post.dart';
import 'package:ninety_nine_days_of_flutter/day_20/widgets/stories_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: [
                    Text('Instagram',
                        style: GoogleFonts.bilboSwashCaps(
                            color: Colors.white, fontSize: 35)),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              // * Stories
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: ImageData().stories.length,
                  itemBuilder: (context, index) {
                    final story = ImageData().stories[index];
                    return StoriesIcon(
                      imagePath: story.imagePath,
                      userName: story.userName,
                      index: index,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // * Post feed
              Column(
                children: ImageData()
                    .posts
                    .map((post) => Post(
                          videoPath: post.videoPath,
                          imagePath: post.imnagePath,
                          description: post.description,
                          userName: post.userName,
                          viewCount: post.viewCount,
                          userImagePath: post.userImagePath,
                          additionalInfo: post.additionalInfo,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
