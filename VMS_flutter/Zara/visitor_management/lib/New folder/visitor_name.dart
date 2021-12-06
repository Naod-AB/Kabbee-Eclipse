// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/buttons.dart';

// import 'package:visitor_management/route/route.dart' as route;

class VisitorName extends StatelessWidget {
  const VisitorName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      heightFactor: 0.95,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue.shade500),
        ),
        child: Scaffold(
          appBar: appBars(),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Take this to header
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Divider(
                      // indent: 200.0,
                      // endIndent: 200.0,
                      height: 5.0,
                      color: Colors.blue.shade500,
                    ),
                  ),
                  SizedBox(
                    height: 20.0, // to create a space between two elements
                  ),

                  Headline("PLEASE SELECT YOUR NAME"),
                  OutlinedNameBtn("VISITOR"),
                  OutlinedNameBtn("MARTHA"),
                  OutlinedNameBtn("YEMANE"),
                  OutlinedNameBtn("EVEN"),
                  OutlinedNameBtn("SAMUEL"),
                  OutlinedNameBtn("FITSUM"),
                  OutlinedNameBtn("SAMUEL"),
                  OutlinedNameBtn("FITSUM"),
                  OutlinedNameBtn("SAMUEL"),
                  OutlinedNameBtn("FITSUM"),
                  OutlinedNameBtn("SAMUEL"),
                  OutlinedNameBtn("FITSUM"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
