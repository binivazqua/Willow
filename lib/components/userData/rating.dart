import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class rating extends StatefulWidget {
  late final double value;
  rating({super.key});

  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        tapOnlyMode: true,
        glow: false,
        itemCount: 5,
        initialRating: 0,
        minRating: 0,
        itemBuilder: (context, _) => Icon(
              Icons.star_rate_rounded,
              color: Colors.purple[100],
            ),
        onRatingUpdate: (rating) =>
            {widget.value = rating, print(widget.value)});
  }
}
