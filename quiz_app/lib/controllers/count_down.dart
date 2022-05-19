import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/profile_controllers.dart';
import '../Models/model.dart';
import '../Models/scores.dart';
import '../api.dart';
import '../routes/router.gr.dart';
import '../controllers/question_controller.dart';

class MyTimer extends StatelessWidget {
  QuestionControl controller = Get.put(QuestionControl());
  ProfileController pcontroller = Get.put(ProfileController());
  dynamic icon;
  @override
  Widget build(BuildContext context) {
    bool x = true;
    Spacer();
    return TimerCountdown(
      format: CountDownTimerFormat.hoursMinutesSeconds,
      endTime: DateTime.now().add(
        Duration(
          hours: 0,
          minutes: 0,
          seconds: 15,
        ),
      ),
      onEnd: () async {
        controller.count = await fetchCorrectAnswers();
        controller.isEnabled.value = false;
        CourseScore score = CourseScore(
            courseName: controller.chosenCourse.value,
            courseType: controller.chosenCourseType.value,
            courseScore: controller.count,
            userId: pcontroller.userInfo.value!.id);
        saveUserScore(score);
        context.router.push(FinalScore(
            outOf: pcontroller.questionApi!.length, score: controller.count));
        controller.qnIndex.value = 1;

        print("Timer finished");
      },
    );
  }
}
