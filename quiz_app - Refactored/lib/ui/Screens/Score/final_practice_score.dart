import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/service/api.dart';
//import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

import '../Profile/widgets/user_profile_widget.dart';

class FinalScore extends StatelessWidget {
  FinalScore(
      {Key? key, required this.outOf, required this.score, this.optionList})
      : super(key: key);

  int outOf;
  int score;
  int? optionList;

  final QuestionControl controller = Get.put(QuestionControl());
  ProfileController pController = Get.find();
  RxBool isLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    // print((double.parse('$score').toInt() / double.parse('$outOf').toInt())
    //     .floor()
    //     .toDouble());
    print('score ${score}');
    print('outof ${outOf}');
    // print('percent ${score / outOf}');
    Future.delayed(
        const Duration(milliseconds: 2300), () => isLoading.value = false);
    return Expanded(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/photo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const Padding(padding: EdgeInsets.only(left: 2500, top: 50)),
              // Title(
              //   color: Colors.white,
              //   child: Text(
              //     'Your Score is $score out of $outOf',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 36.0,
              //         fontWeight: FontWeight.bold,
              //         fontFamily: GoogleFonts.roboto().fontFamily),
              //   ),
              // ),
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
                visible: controller.isEnabled.value,
                child: ElevatedButton(
                  child: customText('REVIEW', 20, false, false, primaryColor),
                  onPressed: () {
                    print(
                        ' reviewlist number ${controller.questionApi!.length}');

                    // deleteSavedAnswers(controller.questionApi!.length);
                    context.router.pushNamed('/review_screen');
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 255, 165, 0), width: 1.5),
                      primary: Colors.transparent),
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
                    child: customText('DONE', 20, false, false, primaryColor),
                    onPressed: () async {
                      pController.scores =
                          await fetchUserScores(pController.userInfo.value!.id);

                      print(' done number ${controller.questionApi!.length}');
                      // deleteSavedAnswers(controller.questionApi!.length);
                      context.router.pushNamed('/category');
                      Get.delete<QuestionControl>();
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
            // '${double.parse('$score').toInt()} / ${double.parse('$outOf').toInt()}',
            '$score/$outOf',
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 165, 0),
                fontSize: 64,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
