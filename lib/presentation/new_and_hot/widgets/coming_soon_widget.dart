import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/home/screen_home.dart';
import '../../../domain/core/api_end_points.dart';
import '../../../infrastructure/http_services.dart';
import '../../widgets/video_player_widget.dart';
import 'package:intl/intl.dart';

class ComingSoonWidget extends StatelessWidget {
  final int index;

  const ComingSoonWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return FutureBuilder(
      // future:  getTopRated(ApiEndPoints.topRating),
      future: getEveryoneWatching(ApiEndPoints.topRating),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List upComing = snapshot.data;

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 450,
                  width: 40,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMM')
                            .format(DateTime.parse('${upComing[index].date}')),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kGreyColor),
                      ),
                      Text(
                        DateFormat('dd')
                            .format(DateTime.parse('${upComing[index].date}')),
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // decoration: BoxDecoration(border: BorderRadius.all(Radius.circular(5)) ),
                        child: VideoWidget(
                          image: ApiEndPoints.imageId + upComing[index].image,
                        ),
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
                      SizedBox(
                        height: 88,
                        child: Text(
                          '${upComing[index].overview}',
                          maxLines: 5,
                          style: const TextStyle(
                            color: kGreyColor,
                          ),
                        ),
                      ),
                      kHeight,
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
