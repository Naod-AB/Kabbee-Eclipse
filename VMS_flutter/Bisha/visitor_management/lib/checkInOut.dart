// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'home.dart';

class Checkin1 extends StatelessWidget {
  const Checkin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(95)),
        Text(
          'YOU ARE CHECKED IN AT',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
        //
        Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Center(
            child: Text(
              "7:30 AM",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue.shade500,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(30.0)),

        ActionButtons(
          btnName: 'DONE',
          width: 300.0,
          page: StartingPage(),
        )
      ],
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(95)),
        Text(
          'YOU ARE CHECKED IN AT',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),

        Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Center(
            child: Text(
              "8:00 AM",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue.shade500,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(30.0)),
        Text(
          'YOU ARE CHECKED OUT AT',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),

        Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Center(
            child: Text(
              "8:00 PM",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue.shade500,
              ),
            ),
          ),
        ),

        // Buttons(btnName: '8:00 PM',
        //   height: 70.0,
        // ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          'HAVE A GOOD EVENING \n SEE YOU TOMORROW',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
        Padding(padding: EdgeInsets.all(30.0)),
        ActionButtons(
          btnName: 'DONE',
          width: 300.0,
          page: StartingPage(),
        )
      ],
    );
  }
}
