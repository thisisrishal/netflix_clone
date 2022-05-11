import 'package:flutter/material.dart';
import 'package:netflix_ui/domain/core/api_end_points.dart';
import 'package:netflix_ui/infrastructure/http_services.dart';
import 'package:netflix_ui/presentation/home/screen_home.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/video_player_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final int index;
  EveryOnesWatchingWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUpComing(ApiEndPoints.upComing),


      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if (snapshot.hasData) {
          List trending = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight,
              Text(
                '${trending[index].title}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
               Text(
                '${trending[index].overview}',
                
                style: TextStyle(color: kGreyColor),
              ),
              kHeight,
              kHeight20,
               VideoWidget(image: 
                '${ApiEndPoints.imageId +trending[index].image}',
              ),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonWidget(
                    icon: Icons.share,
                    title: 'Share',
                    iconSize: 25,
                    textSize: 16,
                  ),
                  kWidth,
                  CustomButtonWidget(
                    icon: Icons.add,
                    title: 'My List',
                    iconSize: 25,
                    textSize: 16,
                  ),
                  kWidth,
                  CustomButtonWidget(
                    icon: Icons.play_arrow,
                    title: 'Play',
                    iconSize: 25,
                    textSize: 16,
                  ),
                  kWidth
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
