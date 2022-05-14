import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/search/widgets/search_idle.dart';
import 'package:netflix_ui/presentation/search/widgets/title.dart';
import 'package:netflix_ui/presentation/widgets/custom_title.dart';

import '../../../domain/core/api_end_points.dart';
import '../../../infrastructure/http_services.dart';

class SearchResultWidget extends StatelessWidget {
  final String search;
  const SearchResultWidget({Key? key, required this.search}) : super(key: key);
  final iamgeUrl =
      "https://assets.gadgets360cdn.com/pricee/assets/product/202201/rrr_1641212816.jpg";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllMovies(ApiEndPoints.allMovies),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List got = snapshot.data;
          List results = [];

          for (var element in got) {
            if (element.title
                    .toString()
                    .toLowerCase()
                    .contains(search.toString().toLowerCase()) &&
                search.isNotEmpty) {
              results.add(element);
              // results ={};

            } else {}
          }
          // print('------------------');
          // print('Data $results');

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight,
              const CustomTitle(title: 'Movies & TV'),
              kHeight,
              Expanded(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(results.length, (index) {
                      return ViewCard2(
                        index: index,
                        listType: results,
                      );
                    })),
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

class MainCard extends StatelessWidget {
  final int index;
  final listType;

  const MainCard({Key? key, required this.index, required this.listType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUpComing(ApiEndPoints.topRating),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List trending = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(
                          ApiEndPoints.imageId + trending[index].image),
                      fit: BoxFit.cover),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class ViewCard2 extends StatelessWidget {
  final int index;
  final listType;

  const ViewCard2({Key? key, required this.index, required this.listType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('=============');
    print(listType[0].image);
    return FutureBuilder(
        future: getAllMovies(ApiEndPoints.allMovies),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // List trending = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(
                          ApiEndPoints.imageId + listType[index].image),
                      fit: BoxFit.cover),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
