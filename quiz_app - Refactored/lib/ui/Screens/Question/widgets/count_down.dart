import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:quiz_app/service/api.dart';
//import 'package:quiz_app/service/model.dart';
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
            hours: controller.hour.value,
            minutes: controller.minutes.value,
            seconds: controller.seconds.value,
          ),
        ),
        onEnd: () async {
          if (controller.isFinished) {
          } else {
            controller.count = await fetchCorrectAnswers();
            print('timer ended');
            double scorePercent =
                (controller.count / controller.questionApi!.length * 100);

            controller.seconds.value = 0;
            controller.isEnabled.value = false;
            String checkid = pcontroller.userInfo.value!.id.toString() +
                controller.chosenCourse.value;
            CourseScore score = CourseScore(
                courseId: checkid,
                courseName: controller.chosenCourse.value,
                courseType: controller.chosenCourseType.value,
                courseScore: controller.count,
                coursePercentage: scorePercent,
                userId: pcontroller.userInfo.value!.id);
            // saveUserScore(score);
            print('checkid timer is ${checkid}');
            if (score.courseId != checkid) {
              saveUserScore(score);
              // print('create score ${score}');
            } else {
              createUserScore(score);
              // print('save score ${score}');
            }
            context.router.push(FinalScore(
              outOf: controller.questionApi!.length,
              score: controller.count,
              optionList: controller.questionApi!.length,
            ));
            controller.qnIndex.value = 1;

            print("Timer finished");
          }
        },
      ),
    );
  }
}
