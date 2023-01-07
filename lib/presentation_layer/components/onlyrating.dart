import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      child: RatingBar.builder(
        itemSize: 20,
        ignoreGestures: true,
        initialRating: nmuberstar.toDouble(),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
        itemBuilder: (context, _) => Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SizedBox(
            child: SvgPicture.asset(
              'assets/icons/star-Filled.svg',
              color: Colors.amber,
              width: 20,
            ),
          ),
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
