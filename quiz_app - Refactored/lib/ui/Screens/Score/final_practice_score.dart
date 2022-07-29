import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/service/services.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';

import '../Profile/widgets/user_profile_widget.dart';
import '../Category/choose_type_screen.dart';

class FinalScore extends StatelessWidget {
  FinalScore(
      {Key? key, required this.outOf, required this.score, this.optionList})
      : super(key: key);

  int outOf;
  int score;
  int? optionList;

 
  RxBool isLoading = true.obs;
  final QuestionController questionController = Get.find();
  @override
  Widget build(BuildContext context) {

    Future.delayed(
        const Duration(milliseconds: 2300), () => isLoading.value = false);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/photo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         
              const Padding(padding: EdgeInsets.all(20)),
              score == outOf
                  ? Obx(() {
                      return isLoading.value
                          ? CircularFinalScore(
                              score: score,
                              outOf: outOf,
                              animationDuration: 2000,
                            )
                          : Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_touohxv0.json',
                              height: 250,
                            );
                    })
                  //: Container(),
                  : CircularFinalScore(
                      score: score,
                      outOf: outOf,
                      animationDuration: 2000,
                    ),
              const Padding(padding: EdgeInsets.all(20)),
              Visibility(
                visible: questionController.isEnabled.value,
                child: ElevatedButton(
                  child: customText(
                      context, 'REVIEW', 20, false, false, primaryColor),
                  onPressed: () {
                    print(
                        ' reviewlist number ${questionController.questionApi!.length}');

                    // deleteSavedAnswers(controller.questionApi!.length);
                    context.router.pushNamed('/review_screen');
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 255, 165, 0), width: 1.5),
                      primary: Color.fromARGB(0, 236, 13, 13)),
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              Obx(() {
                return Visibility(
                  visible: !isLoading.value,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: ElevatedButton(
                    child: customText(
                        context, 'DONE', 20, false, false, primaryColor),
                    onPressed: () async {
                      print('Null error ${controller.userInfo.value!.id}');

                      controller.scores =
                          await fetchUserScores(controller.userInfo.value!.id);

                      print(
                          ' done number ${questionController.questionApi!.length}');
                      // deleteSavedAnswers(controller.questionApi!.length);
                      context.router.pushNamed('/category');
                      Get.delete<QuestionController>();
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: const Color.fromARGB(255, 255, 165, 0)),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

// the circluar final score

class CircularFinalScore extends StatelessWidget {
  CircularFinalScore({
    Key? key,
    required this.score,
    required this.outOf,
    required this.animationDuration,
  }) : super(key: key);
  int score;
  int outOf;
  int animationDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.0,
        height: 250.0,
        child: CircularPercentIndicator(
          radius: 125,
          lineWidth: 15.0,
          backgroundColor: Color.fromARGB(255, 255, 204, 109),
          percent: score / outOf,
          progressColor: kblue,
          circularStrokeCap: CircularStrokeCap.round,
          animation: true,
          animationDuration: animationDuration,
          center: Text(
            '$score/$outOf',
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 165, 0),
                fontSize: 64,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
