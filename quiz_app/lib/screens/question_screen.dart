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
              Container(
                height: 550.0,
                child: PageView.builder(
                    itemCount: pController.questionApi!.length,
                    onPageChanged: (pageNumber) {
                      controller.qnIndex.value = pageNumber + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var options =
                          pController.questionApi![snapshot]['options'] as List;

                      controller.optionList = options.length;
                      return Expanded(
                        child: Container(
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                child: Expanded(
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
                                                          controller.value[
                                                              snapshot][index]
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
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    Spacer(),
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
                                                      pController.questionApi![
                                                              snapshot]
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
                                                            .questionApi![
                                                        snapshot]['id'],
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
                              ),
                            ],
                          ),
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
                          var answered = await fetchSelectedQuestion();

                          print('unanswered is $answered');
                          print('isSelected value is$isSelected');
                          controller.count = await fetchCorrectAnswers();
                          controller.isEnabled.value = true;

                          context.router.push(FinalScore(
                              outOf: pController.questionApi!.length,
                              score: controller.count,
                              optionList: controller.optionList));
                          controller.qnIndex.value = 1;
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 50),
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
