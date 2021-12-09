// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:visitor_management/hanibuttons.dart';
import 'package:visitor_management/checkout.dart';
import 'package:visitor_management/checkin.dart';

class HaniBtn extends StatelessWidget {
  //const NameBtn({ Key? key }) : super(key: key);
  //final String done;
  //HaniBtn(this.done);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(300, 60),
          textStyle: TextStyle(fontSize: 25),
          primary: Colors.blueAccent,
          side: BorderSide(color: Colors.blueAccent),
        ),
        child: Text('DONE'),
        onPressed: () {},
      ),
    );
  }
}

class HaniTime extends StatelessWidget {
  //const NameTime({ Key? key }) : super(key: key);
  final String time;
  HaniTime(this.time);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade500,
          ),
        ),
      ),
    );
  }
}
