import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    bool isback,
    String type) {
  Alert(
    context: context,
    type: type == "INFO" ? AlertType.info : AlertType.warning,
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
      if (type != "INFO")
        DialogButton(
          child: Text(
            //isback ? "" :
            "CANCEL",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
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
            : type != "INFO"
                ? !isFirst
                    ? () async {
                        final QuestionController questionController =
                            Get.find();
                        // remove empty choices and answers
                        questionController.choices
                            .removeWhere((item) => [''].contains(item));
                        questionController.answers
                            .removeWhere((item) => [''].contains(item));
                        questionAlertCtrl.isEnabled.value = false;

                        // check id
                        String checkid =
                            pController.userInfo.value!.id.toString() +
                                questionController.chosenCourse.value;

                        // get percentge
                        int scorePercent = (questionController.answers.length /
                                questionController.questionApi!.length *
                                100)
                            .toInt();

                        // change timer
                        questionController.seconds.value = 0;
                        questionController.isEnabled.value = false;
                        // set the exam counter
                        questionController.checkExamCounter(scorePercent);
                        // set date time
                        DateTime now = DateTime.now();
                        final DateFormat formatter = DateFormat(
                          'yyyy-MM-dd HH:mm:ss',
                        );

                        final String takenDate = formatter.format(now);
                        // get score

                        CourseScore score = CourseScore(
                            courseId:
                                pController.userInfo.value!.id.toString() +
                                    questionController.chosenCourse.value,
                            courseName: questionController.chosenCourse.value,
                            courseType:
                                questionController.chosenCourseType.value,
                            courseScore: questionController.answers.length,
                            coursePercentage: scorePercent,
                            userId: pController.userInfo.value!.id,
                            blocked: questionController.examCounter >= 2
                                ? true
                                : false,
                            counter: questionController.examCounter,
                            takenDate: takenDate);
                        questionController.isFinished = true;

                        if (score.courseId == checkid) {
                          saveUserScore(score);
                          print('saved score ');
                        } else {
                          createUserScore(score);
                          print('creating score ');
                        }
                        context.router.push(FinalScore(
                          outOf: questionController.questionApi!.length,
                          score: questionController.answers.length,
                          optionList: questionController.questionApi!.length,
                        ));
                        questionController.qnIndex.value = 1;
                        questionController.scoreCounter = 0;

                        // previous code
                        // questionAlertCtrl.count = await fetchCorrectAnswers();
                        // double scorePercent = (questionAlertCtrl.count /
                        //     questionAlertCtrl.questionApi!.length *
                        //     100);
                        // String checkid = controller.userInfo.value!.id.toString() +
                        //     questionController.chosenCourse.value;
                        // print(
                        //     'scorePercent.runtimeType ${scorePercent.runtimeType}');
                        // CourseScore score = CourseScore(
                        //     courseId: checkid,
                        //     courseName: questionAlertCtrl.chosenCourse.value,
                        //     courseType: questionAlertCtrl.chosenCourseType.value,
                        //     courseScore: questionAlertCtrl.count,
                        //     coursePercentage: scorePercent,
                        //     userId: controller.userInfo.value!.id);
                        // print("after clicking done button ");
                        // questionAlertCtrl.isFinished = true;
                        // saveUserScore(score);
                        // print('checkid unanswered is ${checkid}');
                        // if (score.courseId != checkid) {
                        // saveUserScore(score);
                        // print('create score ${score}');
                        // } else {
                        //   createUserScore(score);
                        // print('save score ${score}');
                        // }
                        // () => Navigator.pop(context, false);
                        // print('printing score ${questionController.count}');
                        // context.router.push(FinalScore(
                        //     outOf: questionAlertCtrl.questionApi!.length,
                        //     score: questionAlertCtrl.count,
                        //     optionList: questionAlertCtrl.questionApi!.length));
                      }
                    : () async {
                        String? ftype = "FINAL";
                        questionAlertCtrl.questionApi = await fetchQuestionsApi(
                            path.toString().toUpperCase(), ftype);

                        print(
                            'path of final is${path.toUpperCase()} and type is $ftype');
                        String paths = path.toString().toUpperCase();
                        String ftypes = "FINAL";

                        context.router.push(QuestionsScreen(
                            icon: icon,
                            path: paths,
                            isFinal: true,
                            ftype: ftypes));
                      }
                : () => context.router.pop(),
        color: isback ? Colors.transparent : kblue,
      )
    ],
  ).show();
}
