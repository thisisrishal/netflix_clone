import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/search/widgets/search_idle.dart';
import 'package:netflix_ui/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(child:
          // SearchIdleWidget()
          SearchResultWidget()
          ),
        ],
      ),
    )));
  }
}
