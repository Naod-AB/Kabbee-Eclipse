import 'package:flutter/material.dart';

void main() {
  runApp(QuestionsSample());
}

class QuestionsSample extends StatefulWidget {
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionsSample> {
  List<RadioModel> sampleData = [];
  List<int> groupValue = [];
  List<List<int>> value = [];

  int qnIndex = 1;

  @override
  void initState() {
    super.initState();
    sampleData.add(RadioModel(false, 'A', 'April 18', 'text1'));
    sampleData.add(RadioModel(false, 'B', 'April 17', 'text2'));
    sampleData.add(RadioModel(false, 'C', 'April 16', 'text3'));
    sampleData.add(RadioModel(false, 'D', 'April 15', 'text4'));

    groupValue.add(0);
    groupValue.add(5);
    groupValue.add(9);
    groupValue.add(13);

    // value.add([0, 1]);
    // value.add([2, 3]);
    // value.add([4, 5]);
    // value.add([6, 7]);
    value.add([0, 1, 2, 4]);
    value.add([5, 6, 7, 8]);
    value.add([9, 10, 11, 12]);
    value.add([13, 14, 15, 16]);
  }

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
              Text(
                qnIndex.toString() + '/' + sampleData.length.toString(),
                style: TextStyle(fontSize: 30),
              ),

              //page view

              SizedBox(
                height: 500,
                // color: Colors.green,
                child: PageView.builder(
                    itemCount: sampleData.length,
                    onPageChanged: (y) {
                      setState(() {
                        qnIndex = y + 1;
                      });
                    },
                    itemBuilder: (context, snapshot) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80.0 * sampleData.length,
                            // choice cards
                            child: ListView.builder(
                              itemCount: sampleData.length, //4
                              itemBuilder: (context, index) => ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    color: Colors.black12,
                                    child: RadioListTile(
                                      title: Row(
                                        children: [
                                          Text(sampleData[index].buttonText),
                                          Spacer(),
                                          Text(sampleData[index].text),
                                          Spacer(),
                                        ],
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      groupValue: groupValue[
                                          snapshot], // group value[0] 0
                                      value: value[index]
                                          [snapshot], //value[0] 0,1
                                      onChanged: (newValue) => setState(() {
                                        groupValue[snapshot] = newValue as int;
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // display done btn
                          sampleData.length - 1 == snapshot
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


// return Container(
//                   height: 200,
//                   color: Colors.grey[300],
//                   child: ListView.builder(
//                     itemCount: sampleData.length, //4
//                     itemBuilder: (context, index) => ButtonBar(
//                       alignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Radio(
//                           groupValue: groupValue[index], // group value[0] 0
//                           value: value[index][0], //value[0] 0,1
//                           onChanged: (newValue) => setState(() {
//                             groupValue[index] = newValue as int;
//                             print('Value ${value[index][0]}');
//                             print('Group Value ${groupValue[index]}');
//                           }),
//                         ),
//                         Radio(
//                           groupValue: groupValue[index], // group value[1] 2
//                           value: value[index][1], //value[0] 0,1
//                           onChanged: (newValue) => setState(() {
//                             groupValue[index] = newValue as int;
//                             print('Value2 ${value[index][1]}');
//                             print('Group Value2 ${groupValue[index]}');
//                           }),
//                         ),
//                         Radio(
//                           groupValue: groupValue[index], // group value[1] 2
//                           value: value[index][2], //value[0] 0,1
//                           onChanged: (newValue) => setState(() {
//                             groupValue[index] = newValue as int;
//                             print('Value2 ${value[index][1]}');
//                             print('Group Value2 ${groupValue[index]}');
//                           }),
//                         ),
//                         Radio(
//                           groupValue: groupValue[index], // group value[1] 2
//                           value: value[index][3], //value[0] 0,1
//                           onChanged: (newValue) => setState(() {
//                             groupValue[index] = newValue as int;
//                             print('Value2 ${value[index][1]}');
//                             print('Group Value2 ${groupValue[index]}');
//                           }),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
              