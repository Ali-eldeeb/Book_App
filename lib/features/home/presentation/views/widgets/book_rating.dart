import 'package:book/core/utiles/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating ({super.key,  this.mainAxisAlignment =MainAxisAlignment.start, required this.rating, required this.count });

  final num rating ;
  final num count ;
  final MainAxisAlignment mainAxisAlignment ;
  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ) ,
        const SizedBox(
          width: 6.3 ,
        ),
        Text(
          '$rating',
          style: Style.textStyle16,
        ) ,
        const SizedBox(
          width: 5.0,
        ) ,
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Style.textStyle14
          ),
        ) ,



      ],
    );
  }
}