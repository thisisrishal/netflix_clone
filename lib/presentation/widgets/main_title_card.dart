import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/search/widgets/search_results.dart';
import 'package:netflix_ui/presentation/widgets/custom_title.dart';

import '../../domain/core/api_end_points.dart';

class MainTitleCardWidget extends StatelessWidget {
  final String title;
  const MainTitleCardWidget({
    
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: CustomTitle(title:title ),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              ((index) =>  MainCard(index: index,listType: ApiEndPoints.upComing,)),
            ),
          ),
        )
      ],
    );
  }
}
