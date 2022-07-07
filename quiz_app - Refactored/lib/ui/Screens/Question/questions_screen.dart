import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/service/api.dart';
//import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';
import 'package:quiz_app/ui/Screens/Question/widgets/count_down.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
//import 'package:quiz_app/ui/common_widgets/appbar_evalu.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../../common_widgets/alert_box.dart';
import '../../common_widgets/alert_box.dart';
import '/routes/router.gr.dart';
import 'package:auto_size_text/auto_size_text.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen(
      {Key? key,
      required this.icon,
      required this.path,
      required this.isFinal,
      this.ptype,
      this.ftype})
      : super(key: key);
  dynamic icon;
  String path;
  bool isFinal;
  String? ptype;
  String? ftype;

  final QuestionControl controller = Get.put(QuestionControl());
  final ProfileController pcontroller = Get.put(ProfileController());

  // ask Asme
  // Future<bool> _onWillPop() async {
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    var isCorrect = false;
    var isSelected = false;
    controller.questionApi!.shuffle();

    return SafeArea(
      child: WillPopScope(
        onWillPop: isFinal
            ? () {
                return quizAlertBox(
                    context,
                    "navigate",
                    "",
                    "hello you can't back during exam starts",
                    path,
                    icon,
                    controller,
                    false,
                    true);
              }
            : null,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          appBar: quizAppBar(
            context: context,
            iconUrl: icon,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 700.0,
                child: Column(
                  children: [
                    isFinal ? MyTimer() : Container(), //1
                    isFinal ? const Spacer() : Container(), //2
                    Obx(
                      () => Text(
                          controller.qnIndex.toString() +
                              '/' +
                              controller.questionApi!.length.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 540.0,
                      child: PageView.builder(
                          itemCount: controller.questionApi!.length,
                          onPageChanged: (pageNumber) {
                            controller.qnIndex.value = pageNumber + 1;
                          },
                          itemBuilder: (context, snapshot) {
                            var options = controller.questionApi![snapshot]
                                ['options'] as List;
                            controller.optionList = options.length;

                            return Container(
                              padding: const EdgeInsets.fromLTRB(40, 10, 10, 0),
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(176, 34, 34, 34),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // const Spacer(
                                  //   flex: 1,
                                  // ),
                                  Text(
                                    controller.questionApi![snapshot]
                                            ['question']
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  // const Spacer(
                                  //   flex: 2,
                                  // ),
                                  Container(
                                    height: 400.0,
                                    child: ListView.builder(
                                      itemCount: options.length,
                                      itemBuilder: (context, index) =>
                                          ButtonBar(
                                        alignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Obx(
                                            () => Container(
                                              width: 300,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: controller
                                                                    .groupValue[
                                                                snapshot] ==
                                                            controller.value[
                                                                snapshot][index]
                                                        ? kblue
                                                        : const Color.fromARGB(
                                                            255, 117, 110, 110),
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: RadioListTile<int>(
                                                  activeColor: kblue,
                                                  title: Row(
                                                    children: [
                                                      AutoSizeText(
                                                        options[index]
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                  groupValue: controller
                                                      .groupValue[snapshot],
                                                  value: controller
                                                      .value[snapshot][index],
                                                  onChanged: (newValue) {
                                                    controller.groupValue[
                                                            snapshot] =
                                                        newValue as int;
                                                    if (options[index]
                                                            .toString() ==
                                                        controller.questionApi![
                                                                snapshot]
                                                                ['answer']
                                                            .toString()) {
                                                      isCorrect = true;
                                                      isSelected = true;
                                                    } else {
                                                      isCorrect = false;
                                                      isSelected = true;
                                                    }

                                                    updateJsonTime(
                                                      answer: options[index],
                                                      id: controller
                                                              .questionApi![
                                                          snapshot]['id'],
                                                      isCorrect: isCorrect,
                                                      isSelected: isSelected,
                                                    );

                                                    print(
                                                        controller.questionApi![
                                                            snapshot]['id']);
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const Spacer(),
                    Obx(
                      () => controller.questionApi!.length ==
                              controller.qnIndex.value
                          ? ElevatedButton(
                              onPressed: () async {
                                var answered = await fetchSelectedQuestion();
                                // if (unanswered != 4)
                                if (isFinal &&
                                    answered !=
                                        controller.questionApi!.length) {
                                  quizAlertBox(
                                      context,
                                      'Notice',
                                      "CONTINUE",
                                      'hello you have unanswered question . Do you want go back and check or continue to score page ?',
                                      path,
                                      icon,
                                      controller,
                                      false,
                                      false);
                                } else {
                                  controller.count =
                                      await fetchCorrectAnswers();

                                  int scorePercent = (controller.count /
                                          controller.questionApi!.length *
                                          100)
                                      .toInt();
                                  String checkid = pcontroller
                                          .userInfo.value!.id
                                          .toString() +
                                      controller.chosenCourse.value;
                                  CourseScore score = CourseScore(
                                      courseId: checkid,
                                      courseName: controller.chosenCourse.value,
                                      courseType:
                                          controller.chosenCourseType.value,
                                      courseScore: controller.count,
                                      coursePercentage: scorePercent,
                                      userId: pController.userInfo.value!.id);
                                  controller.isFinished = true;

                                  if (isFinal) {
                                    // saveUserScore(score);
                                    controller.isEnabled.value = false;
                                    print('checkid is ${checkid}');
                                    if (score.courseId != checkid) {
                                      saveUserScore(score);
                                      // print('create score ${score}');
                                    } else {
                                      createUserScore(score);
                                      // print('save score ${score}');
                                    }
                                  }
                                  context.router.push(FinalScore(
                                      outOf: controller.questionApi!.length,
                                      score: controller.count,
                                      optionList:
                                          controller.questionApi!.length));
                                  controller.qnIndex.value = 1;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  primary:
                                      const Color.fromARGB(255, 255, 165, 0)),
                              child: const Text('Done'))

                          // ? const RoundedButton(
                          //     buttonName: 'Done',
                          //     page: '/finalScore',
                          //   )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
