import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/model.dart';
import '../../controllers/question_controller.dart';

class FinalScore extends StatelessWidget {
  FinalScore(
      {Key? key,
      required this.outOf,
      required this.score,
      required this.optionList})
      : super(key: key);

  int outOf;
  int score;
  int optionList;

  final QuestionControl controller = Get.put(QuestionControl());

  @override
  Widget build(BuildContext context) {
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
              const Padding(padding: EdgeInsets.only(left: 2500, top: 50)),
              Title(
                color: Colors.white,
                child: Text(
                  'Your Score',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$score/$outOf',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 165, 0),
                          fontSize: 64,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Visibility(
                visible: controller.isEnabled.value,
                child: ElevatedButton(
                  child: const Text('REVIEW'),
                  onPressed: () {
                    context.router.pushNamed('/review_screen');
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 255, 165, 0), width: 1.5),
                      primary: Colors.transparent),
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(
                child: const Text(
                  'DONE',
                ),
                onPressed: () {
                  deleteSavedAnswers(controller.optionList);
                  context.router.pushNamed('/category');
                  Get.delete<QuestionControl>();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: const Color.fromARGB(255, 255, 165, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
