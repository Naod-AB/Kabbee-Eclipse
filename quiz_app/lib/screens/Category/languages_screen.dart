import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/profile_controllers.dart';
import 'package:quiz_app/controllers/question_controller.dart';

// import '../../Models/courses.dart';

import '../../api.dart';
import '../../routes/router.gr.dart';
import '../../widgets/common_components/circularScore.dart';
import '../../widgets/theme.dart';
import '../../widgets/common_components/appbar.dart';
import '../../widgets/common_components/default_card.dart';

class LanguageChoices extends StatelessWidget {
  LanguageChoices({Key? key, required this.courses}) : super(key: key);
  dynamic courses;
  QuestionControl qController = Get.put(QuestionControl());
  ProfileController pController = Get.find();

  @override
  Widget build(BuildContext context) {
    print('courses 👉 ${courses}');
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: quizeAppbar(context),
          body: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text("Select Language",
                  style: Theme.of(context).primaryTextTheme.headline1),
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding * 3),
                  itemCount: courses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    int percentage = 0;
                    for (var element in pController.scores!) {
                      if (courses[index]['courseName'] ==
                          element['courseName']) {
                        log('course name is ${element['courseName']}');
                        log('course score is ${element['percentage']}');
                        percentage = element['percentage'];

                        break;
                      }
                    }

                    return ChoiceCard(
                      child: CircularScore(
                        scorePercent: percentage,
                      ),
                      imgPosY: -100,
                      imgeSrc: courses[index]['icon'],
                      cardtext: courses[index]['courseName'],
                      onpressed: () {
                        qController.chosenCourse.value =
                            courses[index]['courseName'];
                        qController.chosenCourseType.value =
                            courses[index]['category'];
                        context.router.push(ChooseType(
                            icon: courses[index]['icon'],
                            path: courses[index]['courseName']));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: defaultPadding * 3,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
