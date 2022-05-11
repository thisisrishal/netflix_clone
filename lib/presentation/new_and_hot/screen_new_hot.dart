
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_ui/presentation/new_and_hot/widgets/every_one_watching_widget.dart';

class ScreenNewHot extends StatelessWidget {
  const ScreenNewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
            ),
            actions: [
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
            ],
            bottom: TabBar(
              labelColor: kBlackColor,
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(80),
        ),
        body: TabBarView(children: [
          buildComingSoon(),
          buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget buildComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>  ComingSoonWidget(index: index,));
  }

  Widget buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context, index) => EveryOnesWatchingWidget(index: index,));
  }
}
