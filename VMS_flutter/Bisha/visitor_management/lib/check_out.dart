// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/header.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);
  //final String title;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
//  ActionSelect(this.title);

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
                  height: 150.0, // to create a space between two elements
                ),
                Text(
                  "YOU ARE CHECKED IN AT",
                  style: TextStyle(
                    color: Colors.blue.shade500,
                    fontSize: 13.0,
                  ),
                ),
                OutlinedBtn("7:45 AM"),
                SizedBox(
                  height: 20.0, // to create a space between two elements
                ),
                Text(
                  "YOU ARE CHECKED OUT AT",
                  style: TextStyle(
                    color: Colors.blue.shade500,
                    fontSize: 13.0,
                  ),
                ),
                OutlinedBtn("6:00 PM"),
                SizedBox(
                  height: 5.0, // to create a space between two elements
                ),
                Text(
                  "HAVE A GOOD EVENING\n SEE YOU TMORROW",
                  style: TextStyle(
                    color: Colors.blue.shade500,
                    fontSize: 13.0,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 40.0, // to create a space between two elements
                ),
                DoneBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
