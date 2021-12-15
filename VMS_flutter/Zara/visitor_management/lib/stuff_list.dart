// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/action_selection.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/template.dart';

class StuffList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divide(0.7),
            Headline("PLEASE SELECT YOUR NAME", 50.0),
            Nbtn('STAFF', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('EVEN', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', 300, 35, 15, Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('RODAS', 300, 35, 15, Template(Actionselector())),
          ],
        ),
      ),
    );
  }
}
