import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key,required this.title}) : super(key: key);
 final  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style:const TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
       const  Icon(
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
    );
  }
}
