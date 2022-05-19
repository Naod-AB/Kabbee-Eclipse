import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../Models/courses.dart';
import '../../routes/router.gr.dart';
import '../../widgets/theme.dart';
import '../../widgets/common_components/appbar.dart';
import '../../widgets/common_components/default_card.dart';

class FrontEndChoices extends StatelessWidget {
  FrontEndChoices({Key? key}) : super(key: key);
  QuestionControl qController = Get.put(QuestionControl());
  @override
  Widget build(BuildContext context) {
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
                  itemCount: frontendCourses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ChoiceCard(
                        imgPosY: -100,
                        imgeSrc: frontendCourses[index].icon!,
                        cardtext: frontendCourses[index].courseName,
                        onpressed: () {
                          // Get.to(const ChooseType(), arguments: [
                          //   frontendCourses[index].id,
                          //   frontendCourses[index].icon
                          // ]);
                          qController.chosenCourse.value =
                              frontendCourses[index].courseName;
                          qController.chosenCourseType.value =
                              frontendCourses[index].category;
                          print("this is the course");
                          print(qController.chosenCourse.value);
                          context.router.push(ChooseType(
                              icon: frontendCourses[index].icon,
                              path: frontendCourses[index].courseName));
                        });
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
