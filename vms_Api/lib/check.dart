import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'buttons.dart';
import 'template.dart';

class Checkin extends StatelessWidget {
  String userName = Get.parameters['name'].toString();
  String time = Get.parameters['time'].toString();
  String timeGreet = Get.parameters['timeGreet'].toString();

  Checkin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadlineTxt(' $timeGreet', 0.0),
            HeadlineTxt(' $userName', 0.0),
            const SizedBox(height: 40.0),
            const HeadlineTxt('YOU ARE CHECKED IN AT', 0.0),
            CheckTimeboxes(time),
            const SizedBox(height: 50.0),
            DoneBtn(173)
          ],
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  String userName = Get.parameters['name'].toString();
  String timeGreet = Get.parameters['timeGreet'].toString();
  String savedtime = Get.parameters['savedtime'].toString();
  String current = Get.parameters['current'].toString();

  Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadlineTxt(' HELLO $userName', 0.0),
            const SizedBox(height: 40.0),
            const HeadlineTxt('YOU WERE CHECKED IN AT', 0.0),
            CheckTimeboxes(savedtime),
            const SizedBox(height: 30.0),
            const HeadlineTxt('YOU ARE CHECKED OUT AT', 0.0),
            CheckTimeboxes(current),
            const SizedBox(height: 20),
            const HeadlineTxt('SEE YOU TOMORROW', 0.0),
            const SizedBox(height: 50.0),
            DoneBtn(30)
          ],
        ),
      ),
    );
  }
}
