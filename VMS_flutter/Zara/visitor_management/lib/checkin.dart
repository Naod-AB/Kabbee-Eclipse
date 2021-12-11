// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management/hanibuttons.dart';

void main() => runApp(MaterialApp(
      home: checkin(),
    ));

class checkin extends StatelessWidget {
  const checkin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blueAccent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text(
              'KABBEE',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              indent: 410.0,
              endIndent: 410.0,
              height: 5.0,
              color: Colors.blue.shade300,
            ),
            SizedBox(height: 120.0),
            Text(
              'YOU ARE CHECK IN AT',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue.shade400,
              ),
            ),
            HaniTime('7:45AM'),
            SizedBox(
              height: 200.0,
            ),
            HaniBtn(),
          ],
        ),
      ),
    );
  }
}
