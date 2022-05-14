import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/home/widgets/background_card.dart';
import 'package:netflix_ui/presentation/home/widgets/number_card.dart';
import 'package:netflix_ui/presentation/widgets/custom_title.dart';
import 'package:netflix_ui/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    } else if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          BackgroundCardWidget(),
                          kHeight,
                          MainTitleCardWidget(
                            title: 'Released in the past year',
                          ),
                          kHeight,
                          MainTitleCardWidget(
                            title: 'Trending Now',
                          ),
                          kHeight,
                          NumberTitleCardWidget(),
                          kHeight,
                          MainTitleCardWidget(
                            title: 'Tense Dramas',
                          ),
                          kHeight,
                          MainTitleCardWidget(
                            title: 'South Cinema',
                          ),
                          kHeight,
                        ],
                      ),
                      scrollNotifier.value
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              height: 90,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                      ),
                                      kWidth,
                                      Container(
                                        height: 25,
                                        width: 25,
                                        color: Colors.blue,
                                      ),
                                      kWidth
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const[
                                      Text(
                                        'Tv Shows',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'Movies',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'Categories',
                                        style: kHomeTitleText,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ));
            }));
  }
}

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
   CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title, this.iconSize= 25, this.textSize=12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconSize,
        ),
        Text(title,style: TextStyle(fontSize: textSize),)
      ],
    );
  }
}

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: CustomTitle(title: 'Top 10 Tv Shows India  Today'),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              ((index) => NumberCard(
                    index: index,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
