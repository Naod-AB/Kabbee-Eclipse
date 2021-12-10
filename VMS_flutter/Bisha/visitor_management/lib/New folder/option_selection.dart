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

void main() {
  runApp(OptionSelect());
}

class OptionSelect extends StatelessWidget {
  const OptionSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 140.0),
      child: Column(
        children: [
          BlueButtons('VISITOR', ActionPage()),
          BlueButtons('STUDENT', NameList()),
          BlueButtons('STAFF', StaffNameList()),
          BlueButtons('ADMINISTRATOR', AdminNameList()),
        ],
      ),
    );
  }
}

class BlueButtons extends StatelessWidget {
  dynamic name;
  dynamic page;

  BlueButtons(dynamic inputName, dynamic linkedpage) {
    name = inputName;
    page = linkedpage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: null,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(380.0, 60.0),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Verdana',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
