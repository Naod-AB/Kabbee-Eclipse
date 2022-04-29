import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(QuestionSample2());
}

class QuestionControl extends GetxController {
  RxList sampleData = [].obs;
  RxList groupValue = [-1].obs;
  RxList value = [].obs;
  RxInt qnIndex = 1.obs;
  @override
  void onInit() {
    sampleData.add(RadioModel(false, 'A', 'April 18', 'text1'));
    sampleData.add(RadioModel(false, 'B', 'April 17', 'text2'));
    sampleData.add(RadioModel(false, 'C', 'April 16', 'text3'));
    sampleData.add(RadioModel(false, 'D', 'April 15', 'text4'));

    groupValue.add(0);
    groupValue.add(5);
    groupValue.add(9);
    groupValue.add(13);

    value.add([0, 1, 2, 4]);
    value.add([5, 6, 7, 8]);
    value.add([9, 10, 11, 12]);
    value.add([13, 14, 15, 16]);

    super.onInit();
  }
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
                      controller.sampleData.length.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //page view

              SizedBox(
                height: 100.0 * controller.sampleData.length,
                // color: Colors.green,
                child: PageView.builder(
                    itemCount: controller.sampleData.length,
                    onPageChanged: (y) {
                      controller.qnIndex.value = y + 1;
                    },
                    itemBuilder: (context, snapshot) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 80.0 * controller.sampleData.length,
                            // choice cards
                            child: ListView.builder(
                              itemCount: controller.sampleData.length, //4
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
                                            Text(controller
                                                .sampleData[index].buttonText),
                                            // Spacer(),
                                            SizedBox(width: 20),
                                            Text(controller
                                                .sampleData[index].text),
                                            Spacer(),
                                          ],
                                        ),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        groupValue: controller.groupValue[
                                            snapshot], // group value[0] 0
                                        value: controller.value[index]
                                            [snapshot], //value[0] 0,1
                                        onChanged: (newValue) =>
                                            controller.groupValue[snapshot] =
                                                newValue as int,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // display done btn
                          controller.sampleData.length - 1 == snapshot
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
//   List<RadioModel> sampleData = [];
//   List<int> groupValue = [];
//   List<List<int>> value = [];
//   int qnIndex = 1;
//   @override
//   void initState() {
//     super.initState();
//     sampleData.add(RadioModel(false, 'A', 'April 18', 'text1'));
//     sampleData.add(RadioModel(false, 'B', 'April 17', 'text2'));
//     sampleData.add(RadioModel(false, 'C', 'April 16', 'text3'));
//     sampleData.add(RadioModel(false, 'D', 'April 15', 'text4'));
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
//                 qnIndex.toString() + '/' + sampleData.length.toString(),
//                 style: TextStyle(fontSize: 30),
//               ),
//               //page view
//               SizedBox(
//                 height: 500,
//                 // color: Colors.green,
//                 child: PageView.builder(
//                     itemCount: sampleData.length,
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
//                             height: 80.0 * sampleData.length,
//                             // choice cards
//                             child: ListView.builder(
//                               itemCount: sampleData.length, //4
//                               itemBuilder: (context, index) => ButtonBar(
//                                 alignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Container(
//                                     width: 300,
//                                     color: Colors.black12,
//                                     child: RadioListTile(
//                                       title: Row(
//                                         children: [
//                                           Text(sampleData[index].buttonText),
//                                           Spacer(),
//                                           Text(sampleData[index].text),
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
//                           sampleData.length - 1 == snapshot
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

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;
  final String text1;
  String? answer;

  RadioModel(
    this.isSelected,
    this.buttonText,
    this.text,
    this.text1,
  );
}
