import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/routes/router.gr.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/common_widgets/alert_box.dart';

import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:quiz_app/ui/common_widgets/default_card.dart';

import 'package:quiz_app/ui/utils/theme.dart';

import '../CommonControllers/question_controller.dart';

class ChooseType extends StatelessWidget {
  ChooseType({Key? key, required this.icon, required this.path})
      : super(key: key);
  dynamic icon;
  String path;

  final ProfileController controller = Get.put(ProfileController());
  final QuestionControl questionController = Get.put(QuestionControl());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: QuizeAppbar(icon, context),
          body: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text("Select Type ",
                  style: Theme.of(context).primaryTextTheme.headline1),
              Expanded(
                  child: ListView(
                children: [
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -110,
                    imgeSrc: "assets/icons/Practice_test.svg",
                    cardtext: "Practice Test",
                    onpressed: () async {
                      controller.questionApi = await fetchQuestionsApi(
                          path.toLowerCase() + "_practice");

                      print(path.toLowerCase() + "_practice");
                      String paths = path.toLowerCase() + "_practice";
                      context.router
                          .push(QuestionScreen(icon: icon, path: paths));
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -110,
                    imgeSrc: "assets/icons/exam.svg",
                    cardtext: "Evalution Exam",
                    onpressed: () {
                      quizAlertBox(
                          context,
                          'Exam information',
                          'hello you have 2 and half hours time to  finish the exam. are you ready to take exam ?',
                          "OK",
                          path,
                          icon,
                          questionController,
                          true);
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
