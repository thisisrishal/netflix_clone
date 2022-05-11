import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontFamily: 'NetflixSansRegular',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
