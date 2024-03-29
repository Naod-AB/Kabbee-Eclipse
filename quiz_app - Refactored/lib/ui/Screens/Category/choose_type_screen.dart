import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/routes/router.gr.dart';
import 'package:quiz_app/service/services.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:quiz_app/ui/common_widgets/default_card.dart';

import 'package:quiz_app/ui/utils/theme.dart';

import '../../common_widgets/alert_box.dart';
import 'package:get/get.dart';
import '../CommonControllers/question_controller.dart';

class ChooseTypePage extends StatelessWidget {
  ChooseTypePage(
      {Key? key,
      required this.icon,
      required this.path,
      this.ptype,
      this.ftype})
      : super(key: key);
  dynamic icon;
  String path;
  String? ptype = "PRACTICE";
  String? ftype = "FINAL";
  final QuestionController questionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: quizAppBar(context: context, iconUrl: icon),
          body: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text("Select Type".tr,
                  style: Theme.of(context).textTheme.headline5),
              Expanded(
                  child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -110,
                    imgeSrc: "assets/icons/Practice_test.svg",
                    cardtext: "Practice Test".tr,
                    onpressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(child: CircularProgressIndicator());
                        },
                      );
                      String ptype = "PRACTICE";
                      questionController.questionApi =
                          await fetchQuestionsApi(path.toUpperCase(), ptype);
                      questionController.isEnabled.value = true;
                      String paths = path.toUpperCase();
                      String ptypes = "PRACTICE";

                      context.router.push(QuestionsScreen(
                        icon: icon,
                        path: paths,
                        isFinal: false,
                        ptype: ptypes,
                      ));
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -110,
                    imgeSrc: "assets/icons/exam.svg",
                    cardtext: "Evalution Exam".tr,
                    onpressed: () {
                      print("somethign here ");
                      !questionController.fetchSelectedCourseScore()!.blocked!
                          ? quizAlertBox(
                              context,
                              'Exam information'.tr,
                              "OK".tr,
                              'hello you have 2 and half hours time to  finish the exam. are you ready to take exam ?'
                                  .tr,
                              path,
                              icon,
                              questionController,
                              true,
                              false,
                              "WARNING")
                          : quizAlertBox(
                              context,
                              'Exam information'.tr,
                              "OK".tr,
                              'You cannot take the Exam at the moment ,Too many failed attempts'
                                  .tr,
                              path,
                              icon,
                              questionController,
                              true,
                              false,
                              "INFO");
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
