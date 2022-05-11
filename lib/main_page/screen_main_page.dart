import 'package:flutter/material.dart';
import 'package:netflix_ui/main_page/widgets/bottom_nav.dart';
import 'package:netflix_ui/presentation/downloads/screen_downloads.dart';
import 'package:netflix_ui/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_ui/presentation/home/screen_home.dart';
import 'package:netflix_ui/presentation/new_and_hot/screen_new_hot.dart';
import 'package:netflix_ui/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenNewHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
