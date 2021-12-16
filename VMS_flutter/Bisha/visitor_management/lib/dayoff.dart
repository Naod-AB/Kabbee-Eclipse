// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Dayoff extends StatelessWidget {
  const Dayoff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(children: [
        Text(
          "PLEASE SELECT YOUR DAY OFF",
          style: TextStyle(
            color: Colors.blue[600],
            wordSpacing: 5.0,
            fontSize: 20.0,
          ),
        ),
        DatePickerDialog(
          initialDate: DateTime(2021, 12, 1),
          firstDate: DateTime(2021, 12, 1),
          lastDate: DateTime(2092, 1, 1),
        )
      ]),
    );
  }
}
