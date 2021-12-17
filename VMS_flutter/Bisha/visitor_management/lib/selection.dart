// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'checkInOut.dart';
import 'dayoff.dart';
import 'other.dart';
import 'template.dart';
import 'names.dart';
import 'visitor.dart';

// void main() {
//   runApp(OptionSelect());
// }

class OptionSelect extends StatelessWidget {
  const OptionSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        
       padding: const EdgeInsets.all(15.0),
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              BlueButtons(
                  btnName: "VISITOR",
                  page: ActionPage(VisitorPage(), "REGISTER HERE", 0.7)),
              BlueButtons(
                  btnName: "STUDENT",
                  page: ActionPage(NameList(), "PLEASE SELECT YOUR NAME", 0.7)),
              BlueButtons(
                  btnName: "STAFF",
                  page: ActionPage(
                      StaffNameList(), "PLEASE SELECT YOUR NAME", 0.7)),
              BlueButtons(
                  btnName: "ADMINISTRATOR",
                  page: ActionPage(
                      AdminNameList(), "PLEASE SELECT YOUR NAME", 0.7)),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(  
       padding: const EdgeInsets.all(15.0),
        child: Container(
      padding: EdgeInsets.all(0.0),
      child: Column(children: [
        ActionButtons(
            btnName: "CHECK IN", page: ActionPage(Checkin1(), "", 0.33)),
        ActionButtons(
          btnName: "CHECK OUT",
          page: ActionPage(Checkout(), "", 0.33),
        ),
        ActionButtons(
            btnName: "REQUEST DAY OFF",
            page: ActionPage(Dayoff(), "Please select your day off", 0.33)),
        ActionButtons(btnName: "OTHER", page: ActionPage(Other(), "", 0.33)),
      ]),
      ),
      ),
    );
  }
}
