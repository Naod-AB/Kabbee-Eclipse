import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/routes/router.gr.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:quiz_app/ui/common_widgets/default_card.dart';
import 'package:quiz_app/ui/utils/theme.dart';


import 'package:rflutter_alert/rflutter_alert.dart';

class ChooseType extends StatelessWidget {
  ChooseType({Key? key, required this.icon, required this.path})
      : super(key: key);
  dynamic icon;
  String path;

  final ProfileController pController = Get.put(ProfileController());
  final QuestionControl controller = Get.put(QuestionControl());

  @override
  Widget build(BuildContext context) {
    print('path > $path');
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: quizAppBar(context:context, iconUrl:icon ),
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
                      String paths = path.toLowerCase() + "_practice";
                      context.router
                          .push(QuestionsScreen(icon: icon, path: paths, isFinal: false));
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
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Exam information",
                        desc:
                            "hello you have 2 and half hours time to  finish the exam. are you ready to take exam ?",
                        buttons: [
                          DialogButton(
                            child: const Text(
                              "CANCEL",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: const Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: const Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () async {
                              controller.questionApi = await fetchQuestionsApi(
                                  path.toLowerCase() + "_final");
                              String paths = path.toLowerCase() + "_final";
                              context.router.push(
                                  QuestionsScreen(icon: icon, path: paths, isFinal: true));
                            },
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 233, 235, 64),
                              Color.fromARGB(255, 192, 164, 4)
                            ]),
                          )
                        ],
                      ).show();
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
