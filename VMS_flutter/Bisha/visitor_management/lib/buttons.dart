// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:visitor_management/action_select.dart';
import 'package:visitor_management/admin_name.dart';
import 'package:visitor_management/check_in.dart';
import 'package:visitor_management/day_off.dart';
import 'package:visitor_management/other.dart';
import 'package:visitor_management/selection.dart';
import 'package:visitor_management/staff_name.dart';
import 'package:visitor_management/student_name.dart';
import 'package:visitor_management/visitor_name.dart';
import 'package:visitor_management/check_out.dart';

class ElevatedBtn extends StatelessWidget {
  // const SelectBtn({Key? key}) : super(key: key);
  final String option;

  ElevatedBtn(this.option);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
      child: ElevatedButton(
        onPressed: () {
          if (option == "VISITOR") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VisitorName()));
          } else if (option == "STAFF") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StaffName()));
          } else if (option == "STUDENT") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentName()));
          } else if (option == "ADMINISTRATOR") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdminName()));
          }
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(350.0, 40.0),
          primary: Colors.lightBlue, //change background color of button
          onPrimary: Colors.white, //change text color of button
        ),
        child: Text(option),
      ),
    );
  }
}

class OutlinedBtn extends StatelessWidget {
  // const NamesBtn({Key? key}) : super(key: key);
  final String action;

  OutlinedBtn(this.action);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
      child: OutlinedButton(
        onPressed: () {
          if (action == "CHECK IN") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CheckIn()));
          } else if (action == "CHECK OUT") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CheckOut()));
          } else if (action == "REQUEST DAY OFF") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dayoff()));
          } else if (action == "OTHER") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Other()));
          }
        },
        child: Text(action),
        style: OutlinedButton.styleFrom(
          fixedSize: Size(400.0, 50.0),
          side: BorderSide(width: 1.0, color: Colors.blue),
        ),
      ),
    );
  }
}

class OutlinedNameBtn extends StatelessWidget {
  // const NamesBtn({Key? key}) : super(key: key);
  final String action;

  OutlinedNameBtn(this.action);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ActionSelect()));
        },
        child: Text(action),
        style: OutlinedButton.styleFrom(
          fixedSize: Size(300.0, 35.0),
          side: BorderSide(width: 1.0, color: Colors.blue),
        ),
      ),
    );
  }
}

class DoneBtn extends StatelessWidget {
  // const NamesBtn({Key? key}) : super(key: key);
  // final String done;

  // DoneBtn(this.done);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Selection()));
      },
      child: Text(
        "DONE",
        style: TextStyle(
            color: Colors.blue.shade500,
            fontSize: 14.0,
            fontWeight: FontWeight.bold),
      ),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(175.0, 40.0),
        side: BorderSide(width: 1.0, color: Colors.blue),
      ),
    );
  }
}
