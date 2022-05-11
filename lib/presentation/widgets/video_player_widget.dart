import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class VideoWidget extends StatelessWidget {
  final String image;
  VideoWidget({
    Key? key,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 2,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhiteColor,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
