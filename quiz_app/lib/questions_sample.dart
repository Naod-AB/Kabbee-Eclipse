import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quiz_app/Models/Questions.dart';

void main() {
  runApp(QuestionSample2());
}

class RadioModel {
  int id;
  final String buttonText;
  final String text;

  RadioModel(
    this.id,
    this.buttonText,
    this.text,
  );
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
    print('sample_data.length == ${controller.questions.length}');
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
                    onPageChanged: (y) {
                      print(
                          'sample_data.length == ${controller.questions.length}');
                      controller.qnIndex.value = y + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      var x = controller.questions[snapshot]['options'];
                      // print('options list${x}');
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
                                            print(x[index].toString());
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
                                  onPressed: () {}, child: const Text('Done'))
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

// class QuestionsSample extends StatefulWidget {
//   @override
//   _QuestionWidgetState createState() => _QuestionWidgetState();
// }
// class _QuestionWidgetState extends State<QuestionsSample> {
//   List<RadioModel> questions = [];
//   List<int> groupValue = [];
//   List<List<int>> value = [];
//   int qnIndex = 1;
//   @override
//   void initState() {
//     super.initState();
//     questions.add(RadioModel(false, 'A', 'April 18', 'text1'));
//     questions.add(RadioModel(false, 'B', 'April 17', 'text2'));
//     questions.add(RadioModel(false, 'C', 'April 16', 'text3'));
//     questions.add(RadioModel(false, 'D', 'April 15', 'text4'));
//     groupValue.add(0);
//     groupValue.add(5);
//     groupValue.add(9);
//     groupValue.add(13);
//     // value.add([0, 1]);
//     // value.add([2, 3]);
//     // value.add([4, 5]);
//     // value.add([6, 7]);
//     value.add([0, 1, 2, 4]);
//     value.add([5, 6, 7, 8]);
//     value.add([9, 10, 11, 12]);
//     value.add([13, 14, 15, 16]);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("ListItem"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 qnIndex.toString() + '/' + questions.length.toString(),
//                 style: TextStyle(fontSize: 30),
//               ),
//               //page view
//               SizedBox(
//                 height: 500,
//                 // color: Colors.green,
//                 child: PageView.builder(
//                     itemCount: questions.length,
//                     onPageChanged: (y) {
//                       setState(() {
//                         qnIndex = y + 1;
//                       });
//                     },
//                     itemBuilder: (context, snapshot) {
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 80.0 * questions.length,
//                             // choice cards
//                             child: ListView.builder(
//                               itemCount: questions.length, //4
//                               itemBuilder: (context, index) => ButtonBar(
//                                 alignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Container(
//                                     width: 300,
//                                     color: Colors.black12,
//                                     child: RadioListTile(
//                                       title: Row(
//                                         children: [
//                                           Text(questions[index].buttonText),
//                                           Spacer(),
//                                           Text(questions[index].text),
//                                           Spacer(),
//                                         ],
//                                       ),
//                                       controlAffinity:
//                                           ListTileControlAffinity.trailing,
//                                       groupValue: groupValue[
//                                           snapshot], // group value[0] 0
//                                       value: value[index]
//                                           [snapshot], //value[0] 0,1
//                                       onChanged: (newValue) => setState(() {
//                                         groupValue[snapshot] = newValue as int;
//                                       }),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // display done btn
//                           questions.length - 1 == snapshot
//                               ? ElevatedButton(
//                                   onPressed: () {}, child: const Text('Done'))
//                               : Container(),
//                         ],
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
