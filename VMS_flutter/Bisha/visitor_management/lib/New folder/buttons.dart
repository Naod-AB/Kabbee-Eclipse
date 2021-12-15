// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/checkin_1.dart';
import 'package:visitor_management/New%20folder/main.dart';

class Buttons extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  final Color txtColor;
  final double width;
  final double height;
  final double fontSize;
  dynamic page;

  Buttons(
      {this.btnName = '',
      this.btnColor = Colors.white,
      this.txtColor = Colors.blueAccent,
      this.width = 500,
      this.height = 50,
      this.fontSize = 20,
      this.page,});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: Text(
          btnName,
          style: TextStyle(fontSize: fontSize),
        ),
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          side: const BorderSide(width: 1, color: Colors.blueAccent),
          onPrimary: txtColor,
          minimumSize: Size(width, height),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
      const Padding(padding: EdgeInsets.all(15)),
    ]);
  }
}
