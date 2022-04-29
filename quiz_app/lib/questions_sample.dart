import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quiz_app/Models/Questions.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListItem"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  controller.qnIndex.toString() +
                      '/' +
                      controller.questions.length.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //page view

              SizedBox(
                height: 500.0,
                // color: Colors.green,
                child: PageView.builder(
                    itemCount: controller.questions.length,
                    onPageChanged: (pageNumber) {
                      controller.qnIndex.value = pageNumber + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var x = controller.questions[snapshot]['options'];

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.questions[snapshot]['question']
                              .toString()),
                          SizedBox(
                            height: 280.0,
                            // choice cards
                            child: ListView.builder(
                              itemCount: 4, //4
                              itemBuilder: (context, index) => ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    color: Colors.black12,
                                    child: Obx(
                                      () => RadioListTile<int>(
                                          title: Row(
                                            children: [
                                              Text(x[index].toString()),
                                              Spacer(),
                                              SizedBox(width: 20),
                                              // Text(controller
                                              //     .questions[index].text),
                                              Spacer(),
                                            ],
                                          ),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          groupValue: controller.groupValue[
                                              snapshot], // group value[0] 0
                                          value: controller.value[snapshot]
                                              [index], //value[0] 0,1
                                          onChanged: (newValue) {
                                            controller.groupValue[snapshot] =
                                                newValue as int;
                                            // if (controller.chosenAnswers
                                            //     .contains(controller
                                            //             .questions[snapshot]
                                            //         ['id'])) {
                                            //   controller.chosenAnswers.removeAt(
                                            //       controller.questions[snapshot]
                                            //           ['id']);
                                            //   // print(controller.chosenAnswers);
                                            // }
                                            // print(controller.chosenAnswers);

                                            controller.chosenAnswers.add(
                                                ChosenModel(
                                                    controller
                                                            .questions[snapshot]
                                                        ['id'] as int,
                                                    x[index].toString()));
                                            print(controller.chosenAnswers);
                                            // controller.chosenAnswers.add(1, 'test');

                                            // print(controller.questions[0]);
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // display done btn
                          controller.questions.length - 1 == snapshot
                              ? ElevatedButton(
                                  onPressed: () {
                                    print(controller.chosenAnswers[0]);
                                  },
                                  child: const Text('Done'))
                              : Container(),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
