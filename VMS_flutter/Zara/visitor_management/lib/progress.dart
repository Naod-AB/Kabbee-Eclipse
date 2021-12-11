import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key, required this.review, required this.per})
      : super(key: key);
  final String review;
  final double per;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          review,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.blue,
            decoration: TextDecoration.none,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 500.0),
            child: LinearPercentIndicator(
              lineHeight: 25,
              percent: per,
              backgroundColor: Colors.blue.shade100,
              progressColor: Colors.blue,
              animation: true,
              animationDuration: 700,
            ),
          ),
        ),
      ],
    );
  }
}
