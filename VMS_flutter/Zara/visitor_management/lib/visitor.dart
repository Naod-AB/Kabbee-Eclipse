// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/header.dart';

import 'package:visitor_management/option_selection.dart';
import 'package:visitor_management/template.dart';

class Visitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divide(0.7),
            Headline("PLEASE ENTER YOUR NAME", 50.0),
            SizedBox(height: 100.0),
            FractionallySizedBox(
              widthFactor: 0.3,
              child: const TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                  labelText: 'YOUR NAME',
                ),
              ),
            ),
            SizedBox(height: 100.0),
            Nbtn('DONE', 250, 60, 25, Template(SelectOption())),
          ],
        ),
      ),
    );
  }
}
