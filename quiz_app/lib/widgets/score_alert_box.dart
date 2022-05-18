import 'package:flutter/material.dart';

import 'pallete.dart';
import 'user_profile_widget.dart';

class ScoreAlertBox extends StatelessWidget {
  const ScoreAlertBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 320,
          height: 200,
          color: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customText('Your score list is Empty !', 21, true, false, kblue),
              Text(
                'Do Some Exams and check your results here.',
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
            ],
          )),
    );
  }
}
