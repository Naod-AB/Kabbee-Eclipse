import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 20.0, // to create a space between two elements
            ),

            SizedBox(
              height: 60.0, // to create a space between two elements
            ),
            Progress(review: "GOAL ACHIEVEMENT", per: 0.62),

            SizedBox(
              height: 20.0, // to create a space between two elements
            ),
            Progress(review: "QUALITY OF WORK", per: 0.74),
            SizedBox(
              height: 20.0, // to create a space between two elements
            ),
            Progress(review: "DELIVERY TIME", per: 0.8),
            SizedBox(
              height: 20.0, // to create a space between two elements
            ),
            Progress(review: "CUSTOMER SATISFACTION", per: 0.97),

            // _ProgressState
          ],
        ),
      ),
    );
  }
}

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
