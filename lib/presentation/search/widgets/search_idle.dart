import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/search/widgets/title.dart';
import 'package:netflix_ui/presentation/widgets/custom_title.dart';

final imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/n3pJwYuPnkw7JX7tOMbH0GRfBPn.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        CustomTitle(title: 'Top Searches',),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) =>
               TopSearchItemsTile()
               )
               ,
              separatorBuilder: (context, index) => kHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemsTile extends StatelessWidget {
  const TopSearchItemsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: screen.width * 0.35,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(imageUrl))),
        ),
        const Expanded(
          child: Text(
            'Snow White',
            style: TextStyle(
                color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 23,
          child: CircleAvatar(backgroundColor: kBlackColor,radius: 22,child: Center(child: Icon(CupertinoIcons.play_fill,color: kwhiteColor,)),),
        )
      ],
    );
  }
}
