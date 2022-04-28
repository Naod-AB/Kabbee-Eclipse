import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/widgets/theme.dart';

import '../controllers/controllo.dart';

class Option extends StatelessWidget {
  Option({Key? key, required this.question}) : super(key: key);
  List<String> question;
  // int index;

  @override
  Widget build(BuildContext context) {
    Controllo _questionController = Get.put(Controllo());
    //Controllo _questionController = Get.find();

    return Column(
        children: question
            .map((choice) => Obx(
                  () => Container(
                      width: 300,
                      margin: const EdgeInsets.only(top: 13),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                _questionController.selectedval.value == choice
                                    ? pColor
                                    : Color.fromARGB(255, 117, 110, 110),
                            width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(children: [
                        RadioListTile(
                            activeColor: pColor,
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Text(
                              choice,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            value: choice,
                            groupValue: _questionController.selectedval.value,
                            onChanged: (val) {
                              _questionController.selectedval.value = choice;
                              _questionController.selectedval.value =
                                  _questionController.selectedval.value;
                            }),
                      ])),
                ))
            .toList());
  }
}
