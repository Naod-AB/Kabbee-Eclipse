// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/adminlist.dart';
import 'package:visitor_management/allbuttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/student_list.dart';
import 'package:visitor_management/stufflist.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.blue.shade500),
      ),
      child: Scaffold(
        appBar: appBars(),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divide(0.7),
                SizedBox(
                  height: 20.0, // to create a space between two elements
                ),
                Headline("PLEASE SELECT ONE OPTION", 50.0),
                Soption('VISITOR', StuffList()),
                SizedBox(
                  height: 23.0,
                ),
                Soption('STUDENT', StudentList()),
                SizedBox(
                  height: 23.0,
                ),
                Soption('STAFF', StuffList()),
                SizedBox(
                  height: 23.0,
                ),
                Soption('ADMINISTRATOR', AdminList()),
                SizedBox(
                  height: 23.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
