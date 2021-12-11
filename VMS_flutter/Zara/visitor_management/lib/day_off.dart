// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';

class Dayoff extends StatelessWidget {
  const Dayoff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      heightFactor: 0.95,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.blue.shade500),
        ),
        child: Scaffold(
          appBar: appBars(),
          body: Center(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divide(0.7),
                  SizedBox(
                    height: 20.0, // to create a space between two elements
                  ),
                  Headline("PICK A DAY OFF", 50.0),
                  DatePickerDialog(
                    initialDate: DateTime(2021, 12, 1),
                    firstDate: DateTime(2021, 12, 1),
                    lastDate: DateTime(2092, 1, 1),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
