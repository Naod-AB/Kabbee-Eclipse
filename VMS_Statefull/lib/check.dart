// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import './time.dart';
import 'buttons.dart';
import 'template.dart';

class Checkin extends StatelessWidget {
  String? userName;
  String? time;
  String? timeGreet;

  Checkin({this.userName, this.timeGreet, this.time, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadlineTxt(' $timeGreet', 0.0),
            SizedBox(height: 0.0),
            HeadlineTxt(' $userName', 0.0),
            SizedBox(height: 40.0),
            HeadlineTxt('YOU ARE CHECKED IN AT', 0.0),
            SizedBox(height: 30.0),
            CheckTimeboxes(time!),
            SizedBox(height: 50.0),
            DoneBtn()
          ],
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  String? savedtime;
  String? userName;
  String? current;
  var timeGreetOut;
  Checkout({this.savedtime, this.timeGreetOut, this.current, this.userName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadlineTxt(' Hello $userName', 0.0),
            SizedBox(height: 40.0),
            HeadlineTxt('YOU WERE CHECKED IN AT', 0.0),
            CheckTimeboxes(savedtime!),
            SizedBox(height: 30.0),
            HeadlineTxt('YOU ARE CHECKED OUT AT', 0.0),
            CheckTimeboxes(current!),
            SizedBox(height: 20),
            HeadlineTxt('Have a $timeGreet,', 0.0),
            HeadlineTxt('SEE YOU TOMORROW', 0.0),
            SizedBox(height: 50.0),
            DoneBtn()
          ],
        ),
      ),
    );
  }
}

class DoneBtn extends StatefulWidget {
  const DoneBtn({Key? key}) : super(key: key);

  @override
  State<DoneBtn> createState() => _DoneBtnState();
}

class _DoneBtnState extends State<DoneBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 17),
            fixedSize: const Size(340, 50),
            side: const BorderSide(width: 1, color: Colors.blue)),
        onPressed: () {
          Navigator.pushNamed(context, '/selection');
        },
        child: Text('Done'));
  }
}
