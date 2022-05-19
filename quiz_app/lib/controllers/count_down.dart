import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../routes/router.gr.dart';
import '../controllers/question_controller.dart';

class MyTimer extends StatelessWidget {
  QuestionControl controller = Get.put(QuestionControl());
  dynamic icon;
  @override
  Widget build(BuildContext context) {
    bool x = true;
    Spacer();
    return TimerCountdown(
      format: CountDownTimerFormat.hoursMinutesSeconds,
      endTime: DateTime.now().add(
        Duration(
          // days: 0,
          hours: 0,
          minutes: 1,
          seconds: 00,
        ),
      ),
      onEnd: () {
        Alert(
          context: context,
          //style: alertStyle,
          type: AlertType.info,
          // isCloseButton: false,
          title: "exam Time",
          desc: "oops sorry your limit time is reached. thank you!!!",
          buttons: [
            DialogButton(
              child: Text(
                "ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => context.router.push(FinalScore(
                  outOf: controller.questions.length, score: controller.count)),
              color: Color.fromARGB(255, 207, 122, 11),
              radius: BorderRadius.circular(8.0),
            ),
          ],
        ).show();

        print("Timer finished");
      },
    );
    //   StepProgressIndicator(
    //     totalSteps: 100,
    //     currentStep: 32,
    //     size: 8,
    //     padding: 0,
    //     selectedColor: Colors.yellow,
    //     unselectedColor: Colors.cyan,
    //     roundedEdges: Radius.circular(10),
    //     selectedGradientColor: LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: [Colors.yellowAccent, Colors.deepOrange],
    //     ),
    //     unselectedGradientColor: LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: [Colors.black, Colors.blue],
    //     ),
    //   );
  }
}
