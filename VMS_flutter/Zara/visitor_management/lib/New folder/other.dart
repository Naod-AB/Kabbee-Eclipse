// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

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
                  FractionallySizedBox(
                    widthFactor: 0.31,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
