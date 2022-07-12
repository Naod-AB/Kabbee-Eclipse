import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/router.gr.dart';
import '../../service/api.dart';
//import '../../service/model.dart';
import '../Screens/CommonControllers/question_controller.dart';
import '../Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';

import '../Screens/Question/models/scores.dart';

final QuestionControl controller = Get.put(QuestionControl());
final ProfileController pcontroller = Get.put(ProfileController());
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
    style: AlertStyle(
      isOverlayTapDismiss: false,
      backgroundColor: Color(0xFF333333),
      buttonsDirection: isback ? ButtonsDirection.column : ButtonsDirection.row,
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
        color: isback ? kblue : Colors.transparent,
        border: Border.all(
            color: isback ? Colors.transparent : Colors.red,
            width: 1,
            style: BorderStyle.solid),
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
                    double scorePercent = (questionAlertCtrl.count /
                        questionAlertCtrl.questionApi!.length *
                        100);

                    String checkid = pcontroller.userInfo.value!.id.toString() +
                        controller.chosenCourse.value;
                    print(
                        'scorePercent.runtimeType ${scorePercent.runtimeType}');
                    CourseScore score = CourseScore(
                        courseId: checkid,
                        courseName: questionAlertCtrl.chosenCourse.value,
                        courseType: questionAlertCtrl.chosenCourseType.value,
                        courseScore: questionAlertCtrl.count,
                        coursePercentage: scorePercent,
                        userId: pcontroller.userInfo.value!.id);
                    print("after clicking done button ");
                    questionAlertCtrl.isFinished = true;
                    // saveUserScore(score);
                    print('checkid unanswered is ${checkid}');
                    if (score.courseId != checkid) {
                      // saveUserScore(score);
                      // print('create score ${score}');
                    } else {
                      createUserScore(score);
                      // print('save score ${score}');
                    }
                    // () => Navigator.pop(context, false);
                    print('printing score ${controller.count}');
                    context.router.push(FinalScore(
                        outOf: questionAlertCtrl.questionApi!.length,
                        score: questionAlertCtrl.count,
                        optionList: questionAlertCtrl.questionApi!.length));
                  }
                : () async {
                    String? ftype = "FINAL";
                    questionAlertCtrl.questionApi = await fetchQuestionsApi(
                        path.toString().toUpperCase(), ftype);

                    print(
                        'path of final is${path.toUpperCase()} and type is $ftype');
                    String paths = path.toString().toUpperCase();
                    String ftypes = "FINAL";

                    print('printing score ${controller.count}');
                    context.router.push(QuestionsScreen(
                        icon: icon, path: paths, isFinal: true, ftype: ftypes));
                  },
        color: isback ? Colors.transparent : kblue,
      )
    ],
  ).show();
}
