// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'template.dart';
import 'package:visitor_management/variable.dart';

class Checkin extends StatelessWidget {
  String? userName;
  String? time;
  String? timeGreet;

  Checkin({this.userName, this.timeGreet, this.time, Key? key})
      : super(key: key);

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
            SizedBox(height: 40.0),
            HeadlineTxt('YOU ARE CHECKED IN AT', 0.0),
            CheckTimeboxes(time!),
            SizedBox(height: 50.0),
            DoneBtn(173)
          ],
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  var savedtime;
  String? userName;
  var current;
  var timeGreetOut;
  Checkout(
      {this.savedtime,
      this.timeGreetOut,
      this.current,
      this.userName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadlineTxt(' HELLO $userName', 0.0),
            SizedBox(height: 40.0),
            HeadlineTxt('YOU WERE CHECKED IN AT', 0.0),
            CheckTimeboxes(savedtime),
            SizedBox(height: 30.0),
            HeadlineTxt('YOU ARE CHECKED OUT AT', 0.0),
            CheckTimeboxes(current),
            SizedBox(height: 20),
            HeadlineTxt('HAVE A $timeGreet,', 0.0),
            HeadlineTxt('SEE YOU TOMORROW', 0.0),
            SizedBox(height: 50.0),
            DoneBtn(30)
          ],
        ),
      ),
    );
  }
}

class DoneBtn extends StatelessWidget {
  double top;
  DoneBtn(this.top, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, top, 0, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Colors.white,
            side: const BorderSide(width: 1, color: Colors.blue),
            onPrimary: Colors.white,
            minimumSize: const Size(200.0, 55.0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/selection');
          },
          child: Text(
            'DONE',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue.shade400,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }
}
