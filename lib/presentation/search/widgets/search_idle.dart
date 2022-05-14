import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/search/widgets/title.dart';
import 'package:netflix_ui/presentation/widgets/custom_title.dart';

import '../../../domain/core/api_end_points.dart';
import '../../../infrastructure/http_services.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/n3pJwYuPnkw7JX7tOMbH0GRfBPn.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllMovies(ApiEndPoints.allMovies),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List got = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight,
              const CustomTitle(
                title: 'Top Searches',
              ),
              kHeight,
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) => TopSearchItemsTile(
                          index: index,
                          listType: got,
                        )),
                    separatorBuilder: (context, index) => kHeight20,
                    itemCount: 10),
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

class TopSearchItemsTile extends StatelessWidget {
  final int index;
  final listType;
  const TopSearchItemsTile(
      {Key? key, required this.index, required this.listType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: screen.width * 0.35,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      ApiEndPoints.imageId + listType[index].image))),
        ),
        Expanded(
          child: Text(
            listType[index].title,
            style: const TextStyle(
                color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 22,
            child: Center(
                child: Icon(
              CupertinoIcons.play_fill,
              color: kwhiteColor,
            )),
          ),
        )
      ],
    );
  }
}
