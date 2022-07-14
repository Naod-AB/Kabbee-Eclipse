import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import '../../routes/router.gr.dart';
import '../../service/api.dart';
//import '../../service/model.dart';
// import '../Screens/CommonControllers/question_controller.dart';
// import '../Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import '../Screens/Profile/widgets/user_profile_widget.dart';
import '../Screens/Question/models/scores.dart';
import '../Screens/Category/choose_type_screen.dart';

// final QuestionControl questionController = Get.put(QuestionControl());
// final ProfileController controller = Get.put(ProfileController());
quizAlertBox(
    // questionController
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
                    // remove empty choices and answers
                    questionController.choices
                        .removeWhere((item) => [''].contains(item));
                    questionController.answers
                        .removeWhere((item) => [''].contains(item));
                    questionAlertCtrl.isEnabled.value = false;

                    // check id
                    String checkid = controller.userInfo.value!.id.toString() +
                        questionController.chosenCourse.value;

                    // get percentge
                    double scorePercent = (questionController.answers.length /
                        questionController.questionApi!.length *
                        100);

                    // change timer
                    questionController.seconds.value = 0;
                    questionController.isEnabled.value = false;

                    // get score
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
                        icon: icon, path: paths, isFinal: true, ftype: ftypes));
                  },
        color: isback ? Colors.transparent : kblue,
      )
    ],
  ).show();
}
