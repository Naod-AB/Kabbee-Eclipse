// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'names.dart';
import 'buttons.dart';

void main() {
  runApp(OptionSelect());
}

class OptionSelect extends StatelessWidget {
  const OptionSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VmsTemplate(),
    );
  }
}

class VmsTemplate extends StatelessWidget {
  const VmsTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        margin: EdgeInsets.all(20.0),
        width: 1450,
        height: 850,
        padding: EdgeInsets.all(2.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.blue, width: 1.5)),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'KABBEE',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Verdana',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Divider(
                thickness: 1.5,
                color: Colors.blueAccent,
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Container(
              margin: EdgeInsets.only(
                top: 20.0,
                bottom: 140.0,
              ),
              child: Text(
                'PLEASE SELECT ONE OPTION',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.blue,
                  fontFamily: 'Verdana',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlueButtons('VISITOR', ActionPage()),
            BlueButtons('STUDENT', ActionPage()),
            BlueButtons('STAFF', ActionPage()),
            BlueButtons('ADMINISTRATOR', ActionPage()),
          ],
        ),
      ),
    );
  }
}

class BlueButtons extends StatelessWidget {
  dynamic name;
  dynamic page;

  BlueButtons(dynamic inputName, dynamic linkedpage) {
    name = inputName;
    page = linkedpage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: null,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(380.0, 60.0),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Verdana',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
