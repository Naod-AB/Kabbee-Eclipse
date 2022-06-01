import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';


import '../../../../routes/router.gr.dart';



class MyTimer extends StatelessWidget {
  QuestionControl controller = Get.put(QuestionControl());
  ProfileController pcontroller = Get.put(ProfileController());
  dynamic icon;
  @override
  Widget build(BuildContext context) {
    Spacer();

    return Obx(
      () => TimerCountdown(
        format: CountDownTimerFormat.hoursMinutesSeconds,
        endTime: DateTime.now().add(
          Duration(
            hours: controller.h.value,
            minutes: controller.m.value,
            seconds: controller.s.value,
          ),
        ),
        onEnd: () async {
          if (controller.isFinished) {
          } else {
            controller.count = await fetchCorrectAnswers();
            print('timer ended');
            double scorePercent =
                controller.count / pcontroller.questionApi!.length * 100;

            controller.s.value = 0;
            controller.isEnabled.value = false;
            CourseScore score = CourseScore(
                courseName: controller.chosenCourse.value,
                courseType: controller.chosenCourseType.value,
                courseScore: controller.count,
                coursePercentage: scorePercent,
                userId: pcontroller.userInfo.value!.id);
            saveUserScore(score);
            context.router.push(FinalScore(
              outOf: pcontroller.questionApi!.length,
              score: controller.count,
              optionList: controller.optionList,
            ));
            controller.qnIndex.value = 1;

            print("Timer finished");
          }
        },
      ),
    );
  }
}
