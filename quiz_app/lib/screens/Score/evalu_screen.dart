import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/controllers/count_down.dart';
//import 'package:quiz_app/screens/Score/final_practice_score.dart';
import '/routes/router.gr.dart';
import '../../Models/model.dart';
import '../../controllers/count_down.dart';

import '../../widgets/common_components/appbar_evalu.dart';
import '../../controllers/question_controller.dart';
import '/widgets/pallete.dart';

RxBool isEnabled = true.obs;

class evaluationScreens extends StatelessWidget {
  evaluationScreens({Key? key, required this.icon}) : super(key: key);
  dynamic icon;

  final QuestionControl controller = Get.put(QuestionControl());
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    var isCorrect = false;
    // int? newValue;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: evaluAppbar(icon, context),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
          child: Column(
            children: [
              //                Expanded(

              //             child:Alert(
              //   context: context,
              //   //type: AlertType.warning,
              //   title: "Exam information",
              //   desc:
              //       "hello you have 2 and half hours time to  finish the exam. are you ready to take exam ?",
              //   buttons: [
              //     DialogButton(
              //       child: Text(
              //         "CANCEL",
              //         style: TextStyle(color: Colors.white, fontSize: 20),
              //       ),
              //       onPressed: () => Navigator.pop(context),
              //       color: Color.fromRGBO(0, 179, 134, 1.0),
              //     ),
              //     DialogButton(
              //       child: Text(
              //         "OK",
              //         style: TextStyle(color: Colors.white, fontSize: 20),
              //       ),
              //       onPressed: () => context.router.push(evaluationScreen(icon: icon)),
              //       gradient: LinearGradient(colors: [
              //         Color.fromARGB(255, 233, 235, 64),
              //         Color.fromARGB(255, 192, 164, 4)
              //       ]),
              //     )
              //   ],
              // ).show();
              //           ),
              Expanded(
                child: MyTimer(),
              ),
              // Expanded(
              //     child: StepProgressIndicator(
              //   totalSteps: controller.questions.length,
              //   currentStep: 1,
              //   size: 15,
              //   padding: 0,
              //   selectedColor: Colors.yellow,
              //   unselectedColor: Colors.cyan,
              //   roundedEdges: Radius.circular(10),
              //   selectedGradientColor: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [Colors.yellowAccent, Colors.deepOrange],
              //   ),
              //   unselectedGradientColor: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [Colors.black, Colors.blue],
              //   ),
              // )),
              Spacer(),
              Obx(
                () => Text(
                    controller.qnIndex.toString() +
                        '/' +
                        controller.questions.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              // SizedBox(height: 15),
              SizedBox(
                height: 600.0,
                child: PageView.builder(
                    itemCount: controller.questions.length,
                    onPageChanged: (pageNumber) {
                      controller.qnIndex.value = pageNumber + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var options = controller.questions[snapshot]['options'];

                      return Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 10, 0),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 88, 79, 79),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              controller.questions[snapshot]['question']
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
                                                  controller.questions[snapshot]
                                                          ['answer']
                                                      .toString()) {
                                                isCorrect = true;
                                                print('object');
                                              } else {
                                                isCorrect = false;
                                              }
                                              updateJsonTime(
                                                answer: options[index],
                                                id: controller
                                                    .questions[snapshot]['id'],
                                                isCorrect: isCorrect,
                                              );
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
                () => controller.questions.length == controller.qnIndex.value
                    ? ElevatedButton(
                        onPressed: () async {
                          controller.count = await fetchCorrectAnswers();
                          isEnabled.value = false;
                          // isActive.value = false;
                          context.router.push(FinalScore(
                              outOf: controller.questions.length,
                              score: controller.count));
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 40),
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
