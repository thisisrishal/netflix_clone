import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List widgets = const[
       _SmartDownloads(),
      Section2(),
      Section3(),
    ];
    return Scaffold(
        appBar: const PreferredSize(
            child: AppBarWidget(
              title: 'Downloads',
            ),
            preferredSize: Size.fromHeight(50)),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
            itemBuilder: ((context, index) => widgets[index]),
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: widgets.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings_outlined,
          color: kwhiteColor,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    final List imageList = [
      "https://assets.gadgets360cdn.com/pricee/assets/product/202201/rrr_1641212816.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-zHFgIlOc2XowP6eQgElW2tsGd4WsTGdKgo0d4Y0dogR2a8E2lDa65E3iwCU3sbSfU6g&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2saTBPAhX4R7HuCcnUDAXTCuQ-DxH0drAnKSBeu23KY4ucH1ik-PbeXRZBDjAL94YB20&usqp=CAU"
    ];
    return Column(
      children: [
        kHeight,
        const Text(
          'Introducing Downloads for you',
          style: TextStyle(
              color: kwhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          'We will download a personlaised selection of \nmovies and shows for you, so there is always\n something to watch on your \ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          width: screen.width,
          height: screen.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: screen.width * 0.28,
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(right: 130, bottom: 20),
                angle: -18,
                size: Size(screen.width * 0.3, screen.width * 0.38),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(left: 130, bottom: 20),
                angle: 18,
                size: Size(screen.width * 0.3, screen.width * 0.38),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 0),
                angle: 0,
                size: Size(screen.width * 0.3, screen.width * 0.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Column(
      children: [
        MaterialButton(
          color: kbuttonColorIndigo,
          minWidth: screen.width * 0.8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onPressed: () {},
          child: const Text(
            'Set up',
            style: TextStyle(color: kwhiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        MaterialButton(
          color: kbuttonColorWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onPressed: () {},
          child: const Text(
            'See What you can download',
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    this.angle = 0,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.height,
        width: size.width,
        // height: screen.width * 0.65,
        // width: screen.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
