// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ninety_nine_days_of_flutter/day_20/widgets/stories_icon.dart';
import 'package:video_player/video_player.dart';

class Post extends StatefulWidget {
  String? videoPath;
  String? imagePath;
  final int viewCount;
  final String userName;
  final String description;
  final String userImagePath;
  final String additionalInfo;

  Post({
    super.key,
    this.videoPath,
    this.imagePath,
    required this.description,
    required this.userName,
    required this.viewCount,
    required this.userImagePath,
    required this.additionalInfo,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  VideoPlayerController? _playerController;
  bool isFav = false, isBookmark = false;

  @override
  void initState() {
    super.initState();
    if (widget.videoPath != null) {
      _playerController = VideoPlayerController.asset(widget.videoPath!)
        ..initialize().then((_) {
          setState(() {}); // Refresh the widget
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedViewCount = NumberFormat('#,###').format(widget.viewCount);
    return widget.videoPath != null
        ? // * Video
        GestureDetector(
            onTap: () {
              setState(() {
                if (_playerController!.value.isPlaying) {
                  _playerController!.pause();
                } else {
                  _playerController!.play();
                }
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: _playerController!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _playerController!.value.aspectRatio,
                              child: VideoPlayer(_playerController!),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                    // * Post header
                    Row(
                      children: [
                        StoriesIcon(
                            imagePath: widget.userImagePath,
                            userName: widget.userName,
                            height: 60,
                            isStory: false,
                            index: 1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              widget.additionalInfo,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // * Action row
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.comment_bank_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isBookmark = !isBookmark;
                            });
                          },
                          child: Icon(
                            isBookmark
                                ? Icons.bookmark
                                : Icons.bookmark_border_rounded,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                // * Comments
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$formattedViewCount views',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: widget.userName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${widget.description}',
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                      ])),
                    ],
                  ),
                )
              ],
            ),
          )
        : // * Image
        GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Image(
                          image: AssetImage(widget.imagePath!),
                        )),
                    // * Post header
                    Row(
                      children: [
                        StoriesIcon(
                            imagePath: widget.userImagePath,
                            userName: widget.userName,
                            height: 60,
                            isStory: false,
                            index: 1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              widget.additionalInfo,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // * Action row
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.comment_bank_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isBookmark = !isBookmark;
                            });
                          },
                          child: Icon(
                            isBookmark
                                ? Icons.bookmark
                                : Icons.bookmark_border_rounded,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                // * Comments
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$formattedViewCount views',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: widget.userName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${widget.description}',
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                      ])),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
