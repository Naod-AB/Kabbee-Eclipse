// import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/service/services.dart';
//import 'package:quiz_app/service/model.dart';
// import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
// import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';
import 'package:quiz_app/ui/Screens/Question/widgets/count_down.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
//import 'package:quiz_app/ui/common_widgets/appbar_evalu.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

// import 'package:rflutter_alert/rflutter_alert.dart';

import '../../common_widgets/alert_box.dart';
import '../../Screens/Category/choose_type_screen.dart';
// import '../../common_widgets/alert_box.dart';
import '../../common_widgets/score_alert_box.dart';
import '../CommonControllers/question_controller.dart';
import '../Profile/widgets/user_profile_widget.dart';
import '/routes/router.gr.dart';
import 'package:auto_size_text/auto_size_text.dart';

// import '../Profile/widgets/user_profile_widget.dart';
// import '../Profile/widgets/user_profile_widget.dart';
// import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';

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

  // final QuestionControl questionController = Get.put(QuestionControl());

  // final ProfileController controller = Get.put(ProfileController());

  // ask Asme
  // Future<bool> _onWillPop() async {
  //   return false;
  // }
  final QuestionController questionController = Get.find();
  @override
  Widget build(BuildContext context) {
    // questionController.isEnabled
    print('visibility.. QUESTION SCREEN ${questionController.isEnabled}');

    var isCorrect = false;
    var isSelected = false;
    questionController.questionApi!.shuffle();
    questionController.choices = List.filled(
        questionController.questionApi!.length + 1, '',
        growable: true);
    questionController.answers = List.filled(
        questionController.questionApi!.length + 1, '',
        growable: true);

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
                    questionController,
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
                height: 750,
                child: questionController.questionApi!.isEmpty
                    ? Center(
                        child: ScoreAlertBox(
                            title: 'No Questions Available',
                            text:
                                'Please practice or choose other languages to test on.'))
                    // : Center(child: ScoreAlertBox(title: '', text: ''))
                    : Column(
                        children: [
                          isFinal ? MyTimer() : Container(), //1
                          isFinal ? const Spacer() : Container(), //2
                          // Question Number
                          Obx(
                            () => Wrap(children: [
                              AutoSizeText(
                                questionController.qnIndex.toString() +
                                    '/' +
                                    questionController.questionApi!.length
                                        .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                                maxLines: 3,
                              ),
                            ]),
                          ),

                          SizedBox(height: 20),

                          // Questions
                          SizedBox(
                            height: 540.0,
                            child: PageView.builder(
                                itemCount:
                                    questionController.questionApi!.length,
                                onPageChanged: (pageNumber) {
                                  questionController.qnIndex.value =
                                      pageNumber + 1;
                                },
                                itemBuilder: (context, snapshot) {
                                  var options =
                                      questionController.questionApi![snapshot]
                                          ['options'] as List;
                                  questionController.optionList =
                                      options.length;

                                  return Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 10, 0),
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      // color: Colors.green,
                                      color:
                                          const Color.fromARGB(176, 34, 34, 34),

                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Spacer(
                                          flex: 1,
                                        ),
                                        AutoSizeText(
                                          questionController
                                              .questionApi![snapshot]
                                                  ['question']
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(color: Colors.white),
                                          maxLines: 3,
                                        ),
                                        const Spacer(
                                          flex: 2,
                                        ),
                                        Container(
                                          height: 400.0,
                                          child: ListView.builder(
                                            itemCount: options.length,
                                            itemBuilder: (context, index) =>
                                                ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Obx(
                                                  () => Container(
                                                      width: 300,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: questionController
                                                                            .groupValue[
                                                                        snapshot] ==
                                                                    questionController
                                                                            .value[snapshot]
                                                                        [index]
                                                                ? kblue
                                                                : const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    117,
                                                                    110,
                                                                    110),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Obx(() {
                                                        return RadioListTile<
                                                                int>(
                                                            activeColor: kblue,
                                                            title: Wrap(
                                                              children: [
                                                                AutoSizeText(
                                                                  options[index]
                                                                      .toString(),
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline5!
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.white),
                                                                  maxLines: 2,
                                                                ),
                                                                const Spacer(),
                                                              ],
                                                            ),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            groupValue:
                                                                questionController
                                                                        .groupValue[
                                                                    snapshot],
                                                            value: questionController
                                                                        .value[
                                                                    snapshot]
                                                                [index],
                                                            onChanged:
                                                                (newValue) {
                                                              questionController
                                                                          .groupValue[
                                                                      snapshot] =
                                                                  newValue
                                                                      as int;

                                                              // add choices to list without replacing

                                                              questionController
                                                                  .choices
                                                                  .removeAt(
                                                                      questionController
                                                                          .qnIndex
                                                                          .value);
                                                              questionController
                                                                  .choices
                                                                  .insert(
                                                                      questionController
                                                                          .qnIndex
                                                                          .value,
                                                                      options[index]
                                                                          .toString());

                                                              // save the correct ansers for score

                                                              if (options[index]
                                                                      .toString() ==
                                                                  questionController
                                                                      .questionApi![
                                                                          snapshot]
                                                                          [
                                                                          'answer']
                                                                      .toString()) {
                                                                // add answer
                                                                questionController
                                                                    .answers
                                                                    .removeAt(questionController
                                                                        .qnIndex
                                                                        .value);

                                                                questionController.answers.insert(
                                                                    questionController
                                                                        .qnIndex
                                                                        .value,
                                                                    options[index]
                                                                        .toString());
                                                              } else {
                                                                // remove answer
                                                                questionController
                                                                    .answers
                                                                    .removeAt(questionController
                                                                        .qnIndex
                                                                        .value);
                                                                questionController
                                                                    .answers
                                                                    .insert(
                                                                        questionController
                                                                            .qnIndex
                                                                            .value,
                                                                        '');
                                                              }

                                                              // log('choice ${questionController.choices}');
                                                              // log('answers ${questionController.answers}');
                                                              // log('answerFromApi ${questionController.questionApi![snapshot]['answer']}');

                                                              // old code for adding score

                                                              // if (options[index]
                                                              //         .toString() ==
                                                              //     questionController
                                                              //         .questionApi![
                                                              //             snapshot]
                                                              //             ['answer']
                                                              //         .toString()) {
                                                              //   questionController
                                                              //       .scoreCounter++;
                                                              //   print(
                                                              //       '🥂 ${questionController.scoreCounter}');
                                                              //   isCorrect = true;
                                                              //   isSelected = true;
                                                              // } else {
                                                              //   if (questionController
                                                              //           .scoreCounter !=
                                                              //       0) {
                                                              //     questionController
                                                              //         .scoreCounter--;
                                                              //     print(
                                                              //         '🥂 ${questionController.scoreCounter}');
                                                              //   }
                                                              //   isCorrect = false;
                                                              //   isSelected = true;
                                                              // }
                                                              // updateJsonTime(
                                                              //   answer: options[index],
                                                              //   id: questionController
                                                              //           .questionApi![
                                                              //       snapshot]['id'],
                                                              //   isCorrect: isCorrect,
                                                              //   isSelected: isSelected,
                                                              // );
                                                              // print(questionController
                                                              //         .questionApi![
                                                              //     snapshot]['id']);
                                                            });
                                                      })),
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
                          SizedBox(
                            height: 10,
                          ),
                          // const Spacer(),
                          // Done button
                          Obx(
                            () => questionController.questionApi!.length ==
                                    questionController.qnIndex.value
                                ? ElevatedButton(
                                    onPressed: () async {
                                      questionController.choices.removeWhere(
                                          (item) => [''].contains(item));
                                      questionController.answers.removeWhere(
                                          (item) => [''].contains(item));

                                      // log('After removing  ${questionController.choices}');
                                      // log('Choices  ${questionController.choices.length}');
                                      // log('Answers  ${questionController.answers.length}');
                                      // log('questionController.questionApi!.length  ${questionController.questionApi!.length}');

                                      if (isFinal) {
                                        print(
                                            'unasnswered is ${questionController.questionApi!.length}');
                                        if (questionController.choices.length !=
                                            questionController
                                                .questionApi!.length) {
                                          quizAlertBox(
                                              context,
                                              'Notice',
                                              "CONTINUE",
                                              'hello you have unanswered question . Do you want go back and check or continue to score page ?',
                                              path,
                                              icon,
                                              questionController,
                                              false,
                                              false);
                                        }
                                      }

                                      double scorePercent =
                                          (questionController.answers.length /
                                              questionController
                                                  .questionApi!.length *
                                              100);
                                      print(
                                          'THE USER PERCENTAGE IS $scorePercent');

                                      CourseScore score = CourseScore(
                                          courseId: controller
                                                  .userInfo.value!.id
                                                  .toString() +
                                              questionController
                                                  .chosenCourse.value,
                                          courseName: questionController
                                              .chosenCourse.value,
                                          courseType: questionController
                                              .chosenCourseType.value,
                                          courseScore:
                                              questionController.answers.length,
                                          coursePercentage: scorePercent,
                                          userId:
                                              controller.userInfo.value!.id);
                                      questionController.isFinished = true;

                                      String checkid = controller
                                              .userInfo.value!.id
                                              .toString() +
                                          questionController.chosenCourse.value;
                                      if (isFinal) {
                                        if (score.courseId == checkid) {
                                          createUserScore(score);
                                        } else {
                                          saveUserScore(score);
                                        }
                                        print('data ${score.courseId}');
                                        questionController.isEnabled.value =
                                            false;
                                      }
                                      if (isFinal) {
                                        if (questionController.choices.length ==
                                            questionController
                                                .questionApi!.length) {
                                          context.router.push(FinalScore(
                                              outOf: questionController
                                                  .questionApi!.length,
                                              score: questionController
                                                  .answers.length,
                                              optionList: questionController
                                                  .optionList));
                                          questionController.qnIndex.value = 1;
                                          questionController.scoreCounter = 0;
                                        }
                                      }
                                      if (!isFinal) {
                                        context.router.push(FinalScore(
                                            outOf: questionController
                                                .questionApi!.length,
                                            score: questionController
                                                .answers.length,
                                            optionList:
                                                questionController.optionList));
                                        questionController.qnIndex.value = 1;
                                        questionController.scoreCounter = 0;
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(300, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        primary: const Color.fromARGB(
                                            255, 255, 165, 0)),
                                    child: customText('DONE'.tr, 20, false,
                                        false, primaryColor),
                                  )

                                // ? const RoundedButton(
                                //     buttonName: 'Done',
                                //     page: '/finalScore',
                                //   )
                                : Container(),
                          ),
                          Spacer(),
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
