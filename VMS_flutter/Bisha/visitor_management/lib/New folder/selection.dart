// ignore_for_file: prefer__ructors, avoid_print, prefer_const_constructors

//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/buttons.dart';

class Selection extends StatelessWidget {
  const Selection({Key? key}) : super(key: key);

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Headline("PLEASE SELECT ONE OPTION"),
                ElevatedBtn("VISITOR"),
                ElevatedBtn("STUDENT"),
                ElevatedBtn("STAFF"),
                ElevatedBtn("ADMINISTRATOR"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
