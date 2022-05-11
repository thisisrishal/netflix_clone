import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class NumberCard extends StatelessWidget {
  final int index;
  NumberCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
                height: 200,
              ),
              Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://assets.gadgets360cdn.com/pricee/assets/product/202201/rrr_1641212816.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -25,
            left: 10,
            child: BorderedText(
              strokeColor: Colors.grey,
              strokeWidth: 5,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                    fontSize: 120,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
