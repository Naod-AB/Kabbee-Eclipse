import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import '../../routes/router.gr.dart';
import '../../service/services.dart';

import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Screens/Profile/widgets/user_profile_widget.dart';
import '../Screens/Question/models/scores.dart';

quizAlertBox(
    BuildContext context,
    String title,
    String confirmationText,
    String description,
    path,
    icon,
    QuestionController questionAlertCtrl,
    bool isFirst,
    bool isback) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: description,
    style: AlertStyle(
      alertElevation: 200,
      isOverlayTapDismiss: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      buttonsDirection: isback ? ButtonsDirection.column : ButtonsDirection.row,
      titleStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      descStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 18,
          fontWeight: FontWeight.w400),
    ),
    buttons: [
      DialogButton(
        child: Text(
          "CANCEL",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20,
          ),
        ),
        onPressed: () => Navigator.pop(context),
        color: isback ? kblue : Colors.transparent,
        border: Border.all(
            color: isback ? Colors.transparent : Colors.red,
            width: 1,
            style: BorderStyle.solid),
      ),
      DialogButton(
        child: Text(
          confirmationText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: isback
            ? null
            : !isFirst
                ? () async {
                    final QuestionController questionController = Get.find();

                    questionController.choices
                        .removeWhere((item) => [''].contains(item));
                    questionController.answers
                        .removeWhere((item) => [''].contains(item));
                    questionAlertCtrl.isEnabled.value = false;

                    String checkid = controller.userInfo.value!.id.toString() +
                        questionController.chosenCourse.value;

                    double scorePercent = (questionController.answers.length /
                        questionController.questionApi!.length *
                        100);

                    questionController.seconds.value = 0;
                    questionController.isEnabled.value = false;

                    CourseScore score = CourseScore(
                        courseId: controller.userInfo.value!.id.toString() +
                            questionController.chosenCourse.value,
                        courseName: questionController.chosenCourse.value,
                        courseType: questionController.chosenCourseType.value,
                        courseScore: questionController.answers.length,
                        coursePercentage: scorePercent,
                        userId: controller.userInfo.value!.id);
                    questionController.isFinished = true;

                    if (score.courseId == checkid) {
                      saveUserScore(score);
                    } else {
                      createUserScore(score);
                    }
                    context.router.push(FinalScore(
                      outOf: questionController.questionApi!.length,
                      score: questionController.answers.length,
                      optionList: questionController.questionApi!.length,
                    ));
                    questionController.qnIndex.value = 1;
                    questionController.scoreCounter = 0;
                  }
                : () async {
                    String? ftype = "FINAL";
                    questionAlertCtrl.questionApi = await fetchQuestionsApi(
                        path.toString().toUpperCase(), ftype);

                    String paths = path.toString().toUpperCase();
                    String ftypes = "FINAL";

                    context.router.push(QuestionsScreen(
                        icon: icon, path: paths, isFinal: true, ftype: ftypes));
                  },
        color: isback ? Colors.transparent : kblue,
      )
    ],
  ).show();
}
