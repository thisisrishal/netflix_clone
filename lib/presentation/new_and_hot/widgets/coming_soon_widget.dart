import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/home/screen_home.dart';
import '../../../domain/core/api_end_points.dart';
import '../../../infrastructure/http_services.dart';
import '../../widgets/video_player_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final int index;

   ComingSoonWidget({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return FutureBuilder(
      // future:  getTopRated(ApiEndPoints.topRating),
      future: getEveryoneWatching(ApiEndPoints.topRating),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List upComing = snapshot.data;

          return Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 450,
                width: 50,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Text(
                      'FEB',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kGreyColor),
                    ),
                    Text(
                      '11',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 450,
                width: screen.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      VideoWidget(
                      image: '${ApiEndPoints.imageId + upComing[index].image}',
                    ),
                    //  VideoWidget(),
                    kHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         SizedBox(
                           width: 170,
                           child: Text(
                            '${upComing[index].title}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                            ),
                        ),
                         ),
                        Row(
                          children: [
                            CustomButtonWidget(
                              icon: Icons.notifications_none,
                              title: 'Remind Me',
                              textSize: 12,
                            ),
                            kWidth,
                            CustomButtonWidget(
                              icon: Icons.info_outline,
                              title: 'Info',
                              textSize: 12,
                            ),
                            kWidth
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'Coming on Friday',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kGreyColor),
                    ),
                    kHeight,
                     Text(
                      '${upComing[index].title}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight,
                     Text(
                      '${upComing[index].overview}',
                                        maxLines: 5,

                      style: const TextStyle(color: kGreyColor,),
                                  
                                       ),
                    kHeight,
                  
                  ],
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
