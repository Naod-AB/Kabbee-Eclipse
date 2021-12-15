// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:visitor_management/template.dart';

class Dayoff extends StatelessWidget {
  const Dayoff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divide(0.7),
          Headline("PICK A DAY OFF", 50.0),
          DatePickerDialog(
            initialDate: DateTime(2021, 12, 1),
            firstDate: DateTime(2021, 12, 1),
            lastDate: DateTime(2092, 1, 1),
          )
        ],
      ),
      //  ),
      //       ),
      //     ),
      //   ),
    );
  }
}
