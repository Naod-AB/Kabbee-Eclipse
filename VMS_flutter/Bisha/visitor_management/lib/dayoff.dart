// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Dayoff extends StatelessWidget {
  const Dayoff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(0.0),
      child: Column(children: [

        DatePickerDialog(
          initialDate: DateTime(2010, 1, 1),
          firstDate: DateTime(2010, 1, 1),
          lastDate: DateTime(2024, 1, 1),
        )
      ]),
        ),
      ),
    );
  }
}
