// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'selection.dart';
import 'home.dart';

class ActionPage extends StatelessWidget {
  dynamic specificPage = OptionSelect();
  dynamic headTxt = " ";
  dynamic divwidth;

  ActionPage(dynamic inputPage, dynamic headText, dynamic dwidth) {
    specificPage = inputPage;
    headTxt = headText;
    divwidth = dwidth;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartingPage()))
                  },
                  child: Text(
                    'KABBEE',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: divwidth,
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Text(
                  headTxt,
                  style: TextStyle(
                      color: Colors.blue[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                specificPage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
