import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/search/widgets/search_idle.dart';
import 'package:netflix_ui/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<String> suggestions = [
    'mov1'
        'mov2'
  ];
  bool value = false;
  String term='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            onTap: () {
              value = true;
              setState(() {});
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => SearchResultWidget()));
            },
            onChanged: (val) {
              term = val;
              setState(() {
                
              });
            },
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
          Expanded(child: value ? SearchResultWidget(search: term,) : SearchIdleWidget()),
        ],
      ),
    )));
  }
}
