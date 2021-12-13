// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/allbuttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/home.dart';
import 'package:visitor_management/select.dart';

class Visitor extends StatelessWidget {
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
                      SizedBox(height: 100.0),
                      FractionallySizedBox(
                        widthFactor: 0.3,
                        child: const TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            labelStyle: TextStyle(color: Colors.blue),
                            border: OutlineInputBorder(),
                            labelText: 'YOUR NAME',
                          ),
                        ),
                      ),
                      SizedBox(height: 100.0),
                      Nbtn('DONE', 250, 60, 25, SelectOption()),
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
