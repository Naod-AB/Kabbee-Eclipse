import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/common_widgets/appbar.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

import '../Profile/widgets/user_profile_widget.dart';
import '/routes/router.gr.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);

  final QuestionControl controller = Get.put(QuestionControl());
  final ProfileController pcontroller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var isCorrect = false;
    return SafeArea(
      child: Scaffold(
        appBar: quizAppBar(context: context),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
          child: Column(
            children: [
              // Question Number
              Obx(
                () => Text(
                    controller.qnIndex.toString() +
                        '/' +
                        controller.questionApi!.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              SizedBox(height: 20),
              // Questions

              SizedBox(
                height: 540.0,
                child: PageView.builder(
                    itemCount: controller.questionApi!.length,
                    onPageChanged: (pageNumber) {
                      controller.qnIndex.value = pageNumber + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var options =
                          controller.questionApi![snapshot]['options'];

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
                            Text(
                              controller.questionApi![snapshot]['question']
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
                                itemCount: controller.optionList,
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
                                                  ? options[index] ==
                                                          controller.questionApi![
                                                                  snapshot]
                                                              ['answer']
                                                      ? kblue
                                                      : kred
                                                  : options[index] ==
                                                          controller.questionApi![
                                                                  snapshot]
                                                              ['answer']
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
                                              AutoSizeText(
                                                options[index].toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          groupValue:
                                              controller.groupValue[snapshot],
                                          value: controller.value[snapshot]
                                              [index],
                                          onChanged: (value) => null,
                                        ),
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
              const Spacer(),
              Obx(
                () => controller.questionApi!.length == controller.qnIndex.value
                    ? ElevatedButton(
                        onPressed: () {
                          print(controller.optionList);
                          deleteSavedAnswers(controller.optionList);
                          context.router.push(const CategoryRoute());
                          controller.qnIndex.value = 1;
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: const Color.fromARGB(255, 255, 165, 0)),
                        child:
                            customText('DONE', 20, false, false, primaryColor))
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
