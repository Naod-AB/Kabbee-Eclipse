// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/progress.dart';

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      heightFactor: 0.95,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.blue.shade500),
        ),
        child: Scaffold(
          appBar: appBars(),
          body: Center(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divide(0.7),
                  SizedBox(
                    height: 20.0, // to create a space between two elements
                  ),
                  Headline("COMPANY REVIEW", 50.0),
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
          ),
        ),
      ),
    );
  }
}
