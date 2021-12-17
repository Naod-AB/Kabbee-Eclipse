// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'home.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(40.0)),
              Text(
                'Enter Your Name Here',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blue,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              SizedBox(
                width: 500.0,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              Padding(padding: EdgeInsets.all(60.0)),
              ActionButtons(
                btnName: 'SUBMIT',
                width: 300.0,
                page: StartingPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
