import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/profile_controllers.dart';
import 'package:quiz_app/widgets/common_components/appbar.dart';

import 'widgets/pallete.dart';
import 'widgets/rounded_button.dart';

void main() {
  runApp(QuestionSample2());
}

class ChosenModel {
  final int questionNumber;
  final String questionAnswer;

  ChosenModel(this.questionNumber, this.questionAnswer);

  @override
  String toString() {
    return '{questionNumber: ${questionNumber}, questionAnswer: ${questionAnswer}}';
  }
}

class QuestionControl extends GetxController {
  List questions = [
    {
      "id": 1,
      "question":
          "Flutter is an open-source UI software development kit created by ______",
      "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
      "answer": "Google",
    },
    {
      "id": 2,
      "question": "When google release Flutter.",
      "options": ['Jun 2017', 'July 2017', 'May 2017', 'May 2018'],
      "answer": "Jun 2017",
    },
    {
      "id": 3,
      "question": "A memory location that holds a single letter or number.",
      "options": ['Double', 'Int', 'Char', 'Word'],
      "answer": "Char",
    },
    {
      "id": 4,
      "question": "What command do you use to output data to the screen?",
      "options": ['Cin', 'Count', 'Cout', 'Output'],
      "answer": "Output",
    },
  ].obs;

  List<ChosenModel> chosenAnswers = [];

  RxList groupValue = [-1, 0, 5, 9, 13].obs;
  RxList value = [
    [0, 1, 2, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
  ].obs;
  RxInt qnIndex = 1.obs;
}

class QuestionSample2 extends StatelessWidget {
  QuestionSample2({Key? key}) : super(key: key);

  final QuestionControl controller = Get.put(QuestionControl());
  ProfileController _questionController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: quizeAppbar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
          child: Column(
            children: [
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
              SizedBox(height: 20),
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
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 88, 79, 79),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Spacer(
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

                                              controller.chosenAnswers.add(
                                                  ChosenModel(
                                                      controller.questions[
                                                              snapshot]['id']
                                                          as int,
                                                      options[index]
                                                          .toString()));
                                              print(controller.chosenAnswers);
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
                    ? const RoundedButton(
                        buttonName: 'Done',
                        page: '',
                      )
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
