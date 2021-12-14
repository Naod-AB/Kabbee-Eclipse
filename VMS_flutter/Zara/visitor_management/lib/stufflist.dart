// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/actionselection.dart';
import 'package:visitor_management/allbuttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/home.dart';

class StuffList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue, width: 1, style: BorderStyle.solid),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('KABBEE',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 5.0,
              ),
              Divide(0.7),
              SizedBox(
                height: 20.0,
              ),
              Headline('PLEASE SELECT YOUR NAME', 0.0),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Nbtn('STAFF', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('ARKAN', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('MARTHA', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('YEMANE', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('EVEN', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('SAMUEL', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('FITSUM', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('SAMUEL', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('AHLEM', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('SEGEN', 300, 35, 15, Actionselector()),
                      SizedBox(height: 15.0),
                      Nbtn('RODAS', 300, 35, 15, Actionselector()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
