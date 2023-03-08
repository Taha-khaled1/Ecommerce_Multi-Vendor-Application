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
      child: RatingBar(
        ignoreGestures: true,
        itemSize: 20,
        initialRating: nmuberstar.toDouble(),
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        ratingWidget: RatingWidget(
          full: SvgPicture.asset(
            'assets/icons/star-Filled.svg',
            color: Colors.amber,
            width: 20,
          ),
          half: SvgPicture.asset(
            'assets/icons/star-Filled.svg',
            color: Colors.amber,
            width: 20,
          ),
          empty: SvgPicture.asset(
            'assets/icons/star-Filled.svg',
            color: Colors.grey,
            width: 20,
          ),
        ),
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
