import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/routes/router.gr.dart';

import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:quiz_app/ui/common_widgets/circularScore.dart';
import 'package:quiz_app/ui/common_widgets/default_card.dart';
import 'package:quiz_app/ui/utils/theme.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:get/get.dart';
import '../CommonControllers/question_controller.dart';

class LanguageChoices extends StatelessWidget {
  LanguageChoices({Key? key, required this.courses}) : super(key: key);
  dynamic courses;

  final QuestionController questionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: quizAppBar(context: context, iconUrl: ''),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 650,
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Text("Select Language".tr,
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 3),
                      itemCount: courses.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        int percentage = 0;
                        print('Profile DATA LANGUAGE ${pController.scores}');
                        if (pController.scores != null) {
                          for (var element in pController.scores) {
                            if (courses[index]['courseName'] ==
                                element.courseName) {
                              percentage = element.coursePercentage!;
                              break;
                            }
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
                            questionController.chosenCourse.value =
                                courses[index]['courseName'];
                            questionController.chosenCourseType.value =
                                courses[index]['category'];
                            context.router.push(ChooseTypeRoute(
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
              ),
            ),
          )),
    );
  }
}
