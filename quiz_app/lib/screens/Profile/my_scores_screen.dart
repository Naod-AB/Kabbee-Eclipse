import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/Models/scores.dart';

// import '../../api.dart';
import '../../widgets/user_profile_widget.dart';

class MyScoresScreen extends StatelessWidget {
  const MyScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchScore();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: customText('My Scores', 18, false, false, primaryColor),
          centerTitle: false,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: customText(controller.scores!.courseName.toString(), 18,
                    false, false, primaryColor),
              ),
              const SizedBox(height: 7),
              sampleCard(context, FontAwesomeIcons.css3,
                  controller.scores!.courseScore.toString()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: customText('API', 18, false, false, primaryColor),
              ),
              const SizedBox(height: 7),
              sampleCard(context, FontAwesomeIcons.networkWired,
                  controller.scores!.courseScore.toString()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: customText('BACK END ', 18, false, false, primaryColor),
              ),
              const SizedBox(height: 7),
              sampleCard(context, FontAwesomeIcons.aws,
                  controller.scores!.courseScore.toString()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    customText('AVERAGE SCORE', 18, false, false, primaryColor),
              ),
              const SizedBox(height: 7),
              sampleCard(context, FontAwesomeIcons.handsClapping,
                  controller.scores!.courseScore.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
