// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'staff_names.dart';
import 'buttons.dart';
import 'Student_names.dart';
import 'admin_names.dart';

// void main() {
//   runApp(OptionSelect());
// }

class OptionSelect extends StatelessWidget {
  const OptionSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 140.0),
      child: Column(
        children: [
          Buttons(
              btnName: "VISITOR",
              btnColor: Colors.blue,
              txtColor: Colors.white,
              width: 420,
              height: 70,
              page: ActionPage(NameList())),
          Buttons(
              btnName: "STUDENT",
              btnColor: Colors.blue,
              txtColor: Colors.white,
              width: 420,
              height: 70,
              page: ActionPage(NameList())),
          Buttons(
              btnName: "STAFF",
              btnColor: Colors.blue,
              txtColor: Colors.white,
              width: 420,
              height: 70,
              page: ActionPage(StaffNameList())),
          Buttons(
              btnName: "ADMINISTRATOR",
              btnColor: Colors.blue,
              txtColor: Colors.white,
              width: 420,
              height: 70,
              page: ActionPage(AdminNameList())),
        ],
      ),
    );
  }
}
