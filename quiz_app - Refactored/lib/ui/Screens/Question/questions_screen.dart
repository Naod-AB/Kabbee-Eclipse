import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/service/services.dart';

import 'package:quiz_app/ui/Screens/Question/models/scores.dart';
import 'package:quiz_app/ui/Screens/Question/widgets/count_down.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:intl/intl.dart';
//import 'package:quiz_app/ui/common_widgets/appbar_evalu.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import '../../common_widgets/alert_box.dart';
import '../../common_widgets/score_alert_box.dart';
import '../CommonControllers/question_controller.dart';
import '../Profile/widgets/user_profile_widget.dart';
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

  final QuestionController qController = Get.find();
  @override
  Widget build(BuildContext context) {
    qController.questionApi!.shuffle();
    qController.choices =
        List.filled(qController.questionApi!.length + 1, '', growable: true);
    qController.answers =
        List.filled(qController.questionApi!.length + 1, '', growable: true);

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
                    qController,
                    false,
                    true,
                    "WARNING");
              }
            : null,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: quizAppBar(
            context: context,
            iconUrl: icon,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
            child: SingleChildScrollView(
              controller: qController.scrolController.value,
              child: SizedBox(
                height: 740,
                child: qController.questionApi!.isEmpty
                    ? Center(
                        child: ScoreAlertBox(
                            title: 'No Questions Available',
                            text:
                                'Please practice or choose other languages to test on.'))
                    : Column(
                        children: [
                          isFinal ? MyTimer() : Container(),
                          isFinal ? const Spacer() : Container(),
                          Obx(
                            () => Wrap(children: [
                              AutoSizeText(
                                qController.qnIndex.toString() +
                                    '/' +
                                    qController.questionApi!.length.toString(),
                                style: Theme.of(context).textTheme.headline4,
                                maxLines: 3,
                              ),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 540.0,
                            child: PageView.builder(
                                itemCount: qController.questionApi!.length,
                                onPageChanged: (pageNumber) {
                                  qController.qnIndex.value = pageNumber + 1;
                                },
                                itemBuilder: (context, snapshot) {
                                  var options =
                                      qController.questionApi![snapshot]
                                          ['options'] as List;
                                  qController.optionList = options.length;

                                  return Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 10, 0),
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        AutoSizeText(
                                          qController.questionApi![snapshot]
                                                  ['question']
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
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
                                                            color: qController
                                                                            .groupValue[
                                                                        snapshot] ==
                                                                    qController.value[
                                                                            snapshot]
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
                                                                      .headline3,
                                                                  maxLines: 2,
                                                                ),
                                                                const Spacer(),
                                                              ],
                                                            ),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            groupValue: qController
                                                                    .groupValue[
                                                                snapshot],
                                                            value: qController
                                                                        .value[
                                                                    snapshot]
                                                                [index],
                                                            onChanged:
                                                                (newValue) {
                                                              qController.groupValue[
                                                                      snapshot] =
                                                                  newValue
                                                                      as int;

                                                              if (
                                                                  // ignore: unrelated_type_equality_checks
                                                                  qController
                                                                          .qnIndex ==
                                                                      qController
                                                                          .questionApi!
                                                                          .length) {
                                                                qController.scrolController.value.animateTo(
                                                                    qController
                                                                        .scrolController
                                                                        .value
                                                                        .position
                                                                        .extentAfter,
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    curve: Curves
                                                                        .easeInOut);
                                                              }

                                                              qController
                                                                  .choices
                                                                  .removeAt(
                                                                      qController
                                                                          .qnIndex
                                                                          .value);
                                                              qController.choices.insert(
                                                                  qController
                                                                      .qnIndex
                                                                      .value,
                                                                  options[index]
                                                                      .toString());

                                                              if (options[index]
                                                                      .toString() ==
                                                                  qController
                                                                      .questionApi![
                                                                          snapshot]
                                                                          [
                                                                          'answer']
                                                                      .toString()) {
                                                                qController
                                                                    .answers
                                                                    .removeAt(qController
                                                                        .qnIndex
                                                                        .value);

                                                                qController.answers.insert(
                                                                    qController
                                                                        .qnIndex
                                                                        .value,
                                                                    options[index]
                                                                        .toString());
                                                              } else {
                                                                qController
                                                                    .answers
                                                                    .removeAt(qController
                                                                        .qnIndex
                                                                        .value);
                                                                qController
                                                                    .answers
                                                                    .insert(
                                                                        qController
                                                                            .qnIndex
                                                                            .value,
                                                                        '');
                                                              }
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
                          const SizedBox(
                            height: 30,
                          ),
                          Obx(
                            () => qController.questionApi!.length ==
                                    qController.qnIndex.value
                                ? ElevatedButton(
                                    onPressed: () async {
                                      qController.choices.removeWhere(
                                          (item) => [''].contains(item));
                                      qController.answers.removeWhere(
                                          (item) => [''].contains(item));

                                      if (isFinal) {
                                        if (qController.choices.length !=
                                            qController.questionApi!.length) {
                                          quizAlertBox(
                                              context,
                                              'Notice',
                                              "CONTINUE",
                                              'hello you have unanswered question . Do you want go back and check or continue to score page ?',
                                              path,
                                              icon,
                                              qController,
                                              false,
                                              false,
                                              "WARNING");
                                        }
                                      }
                                      int examCounter = 0;

                                      int scorePercent = (qController
                                                  .answers.length /
                                              qController.questionApi!.length *
                                              100)
                                          .toInt();
                                      print(
                                          'THE USER PERCENTAGE IS $scorePercent');
                                      examCounter = qController
                                              .checkExamCounter(scorePercent)
                                          as int;
                                      DateTime now = DateTime.now();
                                      final DateFormat formatter = DateFormat(
                                        'yyyy-MM-dd HH:mm:ss',
                                      );

                                      final String takenDate =
                                          formatter.format(now);

                                      CourseScore score = CourseScore(
                                          courseId: pController
                                                  .userInfo.value!.id
                                                  .toString() +
                                              qController.chosenCourse.value,
                                          courseName:
                                              qController.chosenCourse.value,
                                          courseType: qController
                                              .chosenCourseType.value,
                                          courseScore:
                                              qController.answers.length,
                                          coursePercentage: scorePercent,
                                          userId:
                                              pController.userInfo.value!.id,
                                          counter: examCounter,
                                          blocked: false,
                                          takenDate: takenDate);
                                      qController.isFinished = true;

                                      String checkid = pController
                                              .userInfo.value!.id
                                              .toString() +
                                          qController.chosenCourse.value;
                                      if (isFinal) {
                                        if (score.courseId == checkid) {
                                          createUserScore(score);
                                        } else {
                                          saveUserScore(score);
                                        }
                                        qController.isEnabled.value = false;
                                      }
                                      if (isFinal) {
                                        if (qController.choices.length ==
                                            qController.questionApi!.length) {
                                          context.router.push(FinalScore(
                                              outOf: qController
                                                  .questionApi!.length,
                                              score: qController.answers.length,
                                              optionList:
                                                  qController.optionList));
                                          qController.qnIndex.value = 1;
                                          qController.scoreCounter = 0;
                                        }
                                      }
                                      if (!isFinal) {
                                        context.router.push(FinalScore(
                                            outOf:
                                                qController.questionApi!.length,
                                            score: qController.answers.length,
                                            optionList:
                                                qController.optionList));
                                        qController.qnIndex.value = 1;
                                        qController.scoreCounter = 0;
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(300, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        primary: const Color.fromARGB(
                                            255, 255, 165, 0)),
                                    child: customText(context, 'DONE', 20,
                                        false, false, primaryColor),
                                  )
                                : Container(),
                          ),
                          const Spacer(),
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
