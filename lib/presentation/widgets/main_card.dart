import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2saTBPAhX4R7HuCcnUDAXTCuQ-DxH0drAnKSBeu23KY4ucH1ik-PbeXRZBDjAL94YB20&usqp=CAU',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
