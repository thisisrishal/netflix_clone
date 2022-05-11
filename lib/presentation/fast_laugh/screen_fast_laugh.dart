import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/fast_laugh/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
   ScreenFastLaugh({Key? key}) : super(key: key);
   
    List<String> videos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: 
          List.generate(10, (index) {
            return VideoListItem(url: videos[index], index: index,);
          })
        
      )),
    );
  }
}
