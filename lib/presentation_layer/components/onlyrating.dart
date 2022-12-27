import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnlyRating extends StatelessWidget {
  const OnlyRating({
    Key? key,
    required this.nmuberstar,
  }) : super(key: key);
  final int nmuberstar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nmuberstar,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: SizedBox(
              child: SvgPicture.asset(
                'assets/icons/star-Filled.svg',
                color: Colors.amber,
                width: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
