// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/admin_list.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/student_list.dart';
import 'package:visitor_management/stuff_list.dart';
import 'package:visitor_management/template.dart';
import 'package:visitor_management/visitor.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Headline("PLEASE SELECT ONE OPTION", 50.0),
          Soption('VISITOR', Template(Visitor())),
          SizedBox(
            height: 23.0,
          ),
          Soption('STUDENT', Template(StudentList())),
          SizedBox(
            height: 23.0,
          ),
          Soption('STAFF', Template(StuffList())),
          SizedBox(
            height: 23.0,
          ),
          Soption('ADMINISTRATOR', Template(AdminList())),
          SizedBox(
            height: 23.0,
          ),
        ],
      ),
    );
  }
}
