import 'dart:html';

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/startingpage.dart';

import 'buttons.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Checkout()));
}

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YOU ARE CHECKED IN AT',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(
                height: 15,
              ),
              Buttons(
                btnName: '8:00 AM',
              ),
              Text(
                'YOU ARE CHECKED OUT AT',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(
                height: 15,
              ),
              Buttons(btnName: '8:00 AM'),
              SizedBox(
                height: 40,
              ),
              Text(
                'HAVE A GOOD EVENING \n SEE YOU TOMORROW',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(
                height: 100,
              ),
              Buttons(
                btnName: 'DONE',
                page: StartingPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
