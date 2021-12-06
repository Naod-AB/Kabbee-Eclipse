// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/buttons.dart';

class ActionSelect extends StatelessWidget {
  const ActionSelect({Key? key}) : super(key: key);
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
                  height: 20.0, // to create a space between two elements
                ),
                Headline("PLEASE SELECT ONE OF THE FOLLOWING OPTION"),
                OutlinedBtn("CHECK IN"),
                OutlinedBtn("CHECK OUT"),
                OutlinedBtn("REQUEST DAY OFF"),
                OutlinedBtn("OTHER"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
