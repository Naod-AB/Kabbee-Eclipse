import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/routes/router.gr.dart';
// import 'package:get/get.dart';
// import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
// import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:quiz_app/ui/common_widgets/circularScore.dart';
import 'package:quiz_app/ui/common_widgets/default_card.dart';
import 'package:quiz_app/ui/utils/theme.dart';

import 'package:quiz_app/ui/Screens/Category/choose_type_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:get/get.dart';
import '../CommonControllers/question_controller.dart';

// import '../../../routes/router.gr.dart';

class LanguageChoices extends StatelessWidget {
  LanguageChoices({Key? key, required this.courses}) : super(key: key);
  dynamic courses;
  // QuestionControl qController = Get.find();
  // ProfileController pController = Get.find();
  final QuestionController questionController = Get.find();
  @override

  // final QuestionControl questionController = Get.put(QuestionControl());
  Widget build(BuildContext context) {
    // final QuestionControl questionController = Get.put(QuestionControl());
    print('from LANGUAGE ${questionController.questionApi}');
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
                  Text("Select Language",
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
                          for (var element in pController.scores!) {
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
                            print(questionController.chosenCourse.value);
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
