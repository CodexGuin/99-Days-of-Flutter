class ImageData {
  List<StoryData> get stories => [
        const StoryData(imagePath: 'assets/images/day_20/1.jpg', userName: ''),
        const StoryData(
            imagePath: 'assets/images/day_20/2.jpg', userName: 'Genda Li'),
        const StoryData(
            imagePath: 'assets/images/day_20/3.jpg', userName: 'Piper Ho'),
        const StoryData(
            imagePath: 'assets/images/day_20/4.jpg', userName: 'Hackson'),
        const StoryData(
            imagePath: 'assets/images/day_20/5.jpg', userName: 'Tony Ton'),
        const StoryData(
            imagePath: 'assets/images/day_20/6.jpg', userName: 'DJ James'),
        const StoryData(
            imagePath: 'assets/images/day_20/7.jpg', userName: 'Shedia Lak'),
      ];

  List<PostData> get posts => [
        const PostData(
            userName: 'Tony Ton',
            imnagePath: 'assets/images/day_20/p1.jpg',
            viewCount: 512313,
            description: 'Majestic view of a waterfall taken by me!',
            userImagePath: 'assets/images/day_20/5.jpg',
            additionalInfo: 'Singapore great waterfall'),
        const PostData(
            userName: 'Genda Li',
            videoPath: 'assets/videos/day_20/v1.mp4',
            viewCount: 41289,
            description: 'Husbando by the waterfall~',
            userImagePath: 'assets/images/day_20/2.jpg',
            additionalInfo: 'Japan nature reserves, Waterfall'),
        const PostData(
            userName: 'Shedia Lak',
            imnagePath: 'assets/images/day_20/p2.jpg',
            viewCount: 23478901,
            description: 'Beautiful sunset in Japan',
            userImagePath: 'assets/images/day_20/7.jpg',
            additionalInfo: 'Tokyo castle, Naihabu'),
      ];
}

class StoryData {
  final String imagePath;
  final String userName;

  const StoryData({required this.imagePath, required this.userName});
}

class PostData {
  final String? videoPath, imnagePath;
  final String userName;
  final int viewCount;
  final String description;
  final String userImagePath;
  final String additionalInfo;

  const PostData(
      {required this.userName,
      this.videoPath,
      this.imnagePath,
      required this.description,
      required this.viewCount,
      required this.userImagePath,
      required this.additionalInfo});
}
