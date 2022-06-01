import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:quiz_app/Models/scores.dart';
import 'package:quiz_app/api.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../controllers/profile_controllers.dart';
import '../widgets/theme.dart';
import '/routes/router.gr.dart';
import '../Models/model.dart';

import '../widgets/common_components/appbar.dart';
import '../controllers/question_controller.dart';
import '/widgets/pallete.dart';
import 'Score/evalu_screen.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key, required this.icon, required this.path})
      : super(key: key);
  dynamic icon;
  String path;

  final QuestionControl controller = Get.put(QuestionControl());
  final ProfileController pController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    pController.questionApi!.shuffle();

    Size size = MediaQuery.of(context).size;
    var isCorrect = false;
    var isSelected = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: QuizeAppbar(icon, context),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
          child: Column(
            children: [
              Obx(
                () => Text(
                    controller.qnIndex.toString() +
                        '/' +
                        // controller.questions.length.toString(),
                        pController.questionApi!.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 600.0,
                child: PageView.builder(
                    itemCount: pController.questionApi!.length,
                    onPageChanged: (pageNumber) {
                      controller.qnIndex.value = pageNumber + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var options =
                          pController.questionApi![snapshot]['options'] as List;

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
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                pController.questionApi![snapshot]['question']
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Container(
                              height: 400.0,
                              child: ListView.builder(
                                itemCount: 4,
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
                                                  pController
                                                      .questionApi![snapshot]
                                                          ['answer']
                                                      .toString()) {
                                                isCorrect = true;
                                                isSelected = true;
                                                // print('object');
                                              } else {
                                                isCorrect = false;
                                                isSelected = true;
                                              }
                                              updateJsonTime(
                                                answer: options[index],
                                                id: pController
                                                        .questionApi![snapshot]
                                                    ['id'],
                                                isCorrect: isCorrect,
                                                isSelected: isSelected,
                                              );
                                              isSelected = false;
                                              print(options[index]);
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
                () => pController.questionApi!.length ==
                        controller.qnIndex.value
                    // ? Container(
                    //     height: size.height * 0.08,
                    //     width: size.width * 0.8,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: pColor,
                    //     ),
                    ? ElevatedButton(
                        onPressed: () async {
                          //                     if (controller.chosenAnswers!.any(
                          //   (data) => data['isSelected'] == null,
                          // ))
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
                                    controller.isEnabled.value = true;

                                    CourseScore score = CourseScore(
                                        courseName:
                                            controller.chosenCourse.value,
                                        courseType:
                                            controller.chosenCourseType.value,
                                        courseScore: controller.count,
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
                            controller.isEnabled.value = true;
                            CourseScore score = CourseScore(
                                courseName: controller.chosenCourse.value,
                                courseType: controller.chosenCourseType.value,
                                courseScore: controller.count,
                                userId: pController.userInfo.value!.id);
                            print("after clicking done button ");
                            controller.isFinished = false;
                            // isSelected = false;
                            // saveUserScore(score);
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
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
