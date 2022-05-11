import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final String url;
  final int index;

  VideoListItem({Key? key, required this.index,required this.url}) : super(key: key);

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? _controller;

  @override
   void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _controller!.initialize().then((_) {
      _controller!.play().then((value) => _controller!.setLooping(true));
      setState(() {});
    });
  }
    @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : Container(
                color: Colors.black,
                child: const Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                radius: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: kwhiteColor,
                    size: 30,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://assets.gadgets360cdn.com/pricee/assets/product/202201/rrr_1641212816.jpg',
                      ),
                    ),
                  ),
                  VideoActionWidget(icon: Icons.emoji_emotions, title: 'LoL'),
                  VideoActionWidget(icon: Icons.add, title: 'My List'),
                  VideoActionWidget(icon: Icons.share, title: 'Share'),
                  VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: kwhiteColor),
          )
        ],
      ),
    );
  }
}
