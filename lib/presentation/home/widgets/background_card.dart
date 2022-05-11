import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/domain/core/api_end_points.dart';
import 'package:netflix_ui/infrastructure/http_services.dart';
import 'package:netflix_ui/presentation/home/screen_home.dart';

import '../../../core/colors/colors.dart';

class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUpComing(ApiEndPoints.upComing),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List trending = snapshot.data;
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(

                      '${ApiEndPoints.imageId + trending[1].image}'
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // getTrendingMovies(ApiEndPoints.trending);
                          },
                          child: CustomButtonWidget(
                            icon: Icons.add,
                            title: 'My List',
                          ),
                        ),
                        _playButton(),
                        CustomButtonWidget(icon: Icons.info, title: 'Info')
                      ],
                    ))
              ],
            );
          } else {
            return Container();
          }
          ;
        });
  }
}

class _playButton extends StatelessWidget {
  const _playButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhiteColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            'Play',
            style: TextStyle(color: kBlackColor, fontSize: 20),
          ),
        ));
  }
}
