import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';
import 'package:quiz_app/ui/Screens/Question/widgets/count_down.dart';
import 'package:quiz_app/ui/common_widgets/appbar_evalu.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '/routes/router.gr.dart';

class evaluationScreens extends StatelessWidget {
  evaluationScreens({Key? key, required this.icon, required this.path})
      : super(key: key);
  dynamic icon;
  String path;

  final QuestionControl controller = Get.put(QuestionControl());
  final ProfileController pcontroller = Get.put(ProfileController());
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var isCorrect = false;
    var isSelected = false;
    pcontroller.questionApi!.shuffle();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: evaluAppbar(icon, context),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
          child: Column(
            children: [
              MyTimer(),
              Spacer(),
              Obx(
                () => Text(
                    controller.qnIndex.toString() +
                        '/' +
                        pcontroller.questionApi!.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              SizedBox(
                height: 600.0,
                child: PageView.builder(
                    itemCount: pcontroller.questionApi!.length,
                    onPageChanged: (pageNumber) {
                      controller.qnIndex.value = pageNumber + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var options =
                          pcontroller.questionApi![snapshot]['options'] as List;
                      controller.optionList = options.length;

                      return Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 10, 0),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(176, 34, 34, 34),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              pcontroller.questionApi![snapshot]['question']
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Container(
                              height: 400.0,
                              child: ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (context, index) => ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Obx(
                                      () => Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: controller.groupValue[
                                                          snapshot] ==
                                                      controller.value[snapshot]
                                                          [index]
                                                  ? kblue
                                                  : Color.fromARGB(
                                                      255, 117, 110, 110),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: RadioListTile<int>(
                                            activeColor: kblue,
                                            title: Row(
                                              children: [
                                                Text(
                                                  options[index].toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            groupValue:
                                                controller.groupValue[snapshot],
                                            value: controller.value[snapshot]
                                                [index],
                                            onChanged: (newValue) {
                                              controller.groupValue[snapshot] =
                                                  newValue as int;
                                              if (options[index].toString() ==
                                                  pcontroller
                                                      .questionApi![snapshot]
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
                                                id: pcontroller
                                                        .questionApi![snapshot]
                                                    ['id'],
                                                isCorrect: isCorrect,
                                                isSelected: isSelected,
                                              );

                                              print(pcontroller
                                                      .questionApi![snapshot]
                                                  ['id']);
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
              Spacer(),
              Obx(
                () => pcontroller.questionApi!.length ==
                        controller.qnIndex.value
                    ? ElevatedButton(
                        onPressed: () async {
                          var answered = await fetchSelectedQuestion();
                          // if (unanswered != 4)
                          print('unanswered is $answered');
                          print('isSelected value is$isSelected');

                          if (answered != 4) {
                            print('answered is $answered');
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Notice",
                              desc:
                                  "hello you have unanswered question . Do you want go back and check or continue to score page ?",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "back",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "continue",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    controller.count =
                                        await fetchCorrectAnswers();
                                    controller.isEnabled.value = false;
                                    double scorePercent = controller.count /
                                        pcontroller.questionApi!.length *
                                        100;
                                    CourseScore score = CourseScore(
                                        courseName:
                                            controller.chosenCourse.value,
                                        courseType:
                                            controller.chosenCourseType.value,
                                        courseScore: controller.count,
                                        coursePercentage: scorePercent,
                                        userId: pController.userInfo.value!.id);
                                    print("after clicking done button ");
                                    controller.isFinished = true;
                                    saveUserScore(score);
                                    context.router.push(FinalScore(
                                        outOf: pController.questionApi!.length,
                                        score: controller.count,
                                        optionList: controller.optionList));
                                    // controller.qnIndex.value = 1;
                                  },
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 233, 235, 64),
                                    Color.fromARGB(255, 192, 164, 4)
                                  ]),
                                )
                              ],
                            ).show();
                          } else {
                            controller.count = await fetchCorrectAnswers();
                            controller.isEnabled.value = false;
                            double scorePercent = controller.count /
                                pcontroller.questionApi!.length *
                                100;
                            CourseScore score = CourseScore(
                                courseName: controller.chosenCourse.value,
                                courseType: controller.chosenCourseType.value,
                                courseScore: controller.count,
                                coursePercentage: scorePercent,
                                userId: pController.userInfo.value!.id);
                            print("after clicking done button ");
                            controller.isFinished = true;
                            // isSelected = false;
                            saveUserScore(score);
                            context.router.push(FinalScore(
                                outOf: pController.questionApi!.length,
                                score: controller.count,
                                optionList: controller.optionList));
                            controller.qnIndex.value = 1;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: const Color.fromARGB(255, 255, 165, 0)),
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
    );
  }
}
