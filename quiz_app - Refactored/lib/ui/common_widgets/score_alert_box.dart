import 'package:flutter/material.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

class ScoreAlertBox extends StatelessWidget {
  ScoreAlertBox({Key? key, required this.title, required this.text})
      : super(key: key);

  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 320,
          height: 180,
          color: Theme.of(context).colorScheme.tertiary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customText(context, title, 21, true, false, kblue),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18),
              ),
            ],
          )),
    );
  }
}
