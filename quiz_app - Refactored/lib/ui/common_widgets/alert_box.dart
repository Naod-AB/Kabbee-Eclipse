import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/router.gr.dart';
import '../../service/api.dart';
import '../../service/model.dart';
import '../Screens/CommonControllers/question_controller.dart';
import '../Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Screens/Question/models/scores.dart';

quizAlertBox(
    BuildContext context,
    String title,
    String confirmationText,
    String description,
    path,
    icon,
    QuestionControl questionAlertCtrl,
    bool isFirst,
    bool isback) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: description,
    style: const AlertStyle(
      isOverlayTapDismiss: false,
      backgroundColor: Color(0xFF333333),
      titleStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      descStyle: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
    ),
    buttons: [
      DialogButton(
        child: Text(
          //isback ? "" :
          "CANCEL",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () => Navigator.pop(context),
        color: kblue,
        border:
            Border.all(color: Colors.red, width: 1, style: BorderStyle.solid),
      ),
      DialogButton(
        child: Text(
          confirmationText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: isback
            ? null
            : !isFirst
                ? () async {
                    questionAlertCtrl.count = await fetchCorrectAnswers();
                    questionAlertCtrl.isEnabled.value = false;
                    int scorePercent = (questionAlertCtrl.count /
                            questionAlertCtrl.questionApi!.length *
                            100)
                        .toInt();
                    print(
                        'scorePercent.runtimeType ${scorePercent.runtimeType}');
                    CourseScore score = CourseScore(
                        courseName: questionAlertCtrl.chosenCourse.value,
                        courseType: questionAlertCtrl.chosenCourseType.value,
                        courseScore: questionAlertCtrl.count,
                        coursePercentage: scorePercent,
                        userId: controller.userInfo.value!.id);
                    print("after clicking done button ");
                    questionAlertCtrl.isFinished = true;
                    saveUserScore(score);
                    // () => Navigator.pop(context, false);
                    context.router.push(FinalScore(
                        outOf: questionAlertCtrl.questionApi!.length,
                        score: questionAlertCtrl.count,
                        optionList: questionAlertCtrl.optionList));
                  }
                : () async {
                    questionAlertCtrl.questionApi = await fetchQuestionsApi(
                        path.toString().toLowerCase() + "_final");

                    // print(path.toLowerCase() + "_final");
                    String paths = path.toString().toLowerCase() + "_final";
                    context.router.push(QuestionsScreen(
                        icon: icon, path: paths, isFinal: true));
                  },
        color: Colors.transparent,
      )
    ],
  ).show();
}
