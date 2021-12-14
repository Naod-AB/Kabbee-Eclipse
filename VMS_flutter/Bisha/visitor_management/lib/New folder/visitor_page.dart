import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/buttons.dart';
import 'package:visitor_management/New%20folder/startingpage.dart';

class VisitorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 350.0,
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
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)))),
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Buttons(
            btnName: 'SUBMIT',
            width: 200.0,
            height: 50.0,
            page: StartingPage(),
          )
        ],
      ),
    );
  }
}
