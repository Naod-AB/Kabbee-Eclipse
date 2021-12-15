
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/startingpage.dart';

import 'buttons.dart';

/* void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Checkout()));
} */

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(padding: EdgeInsets.all(95)),
              Text('YOU ARE CHECKED IN AT', style: TextStyle(fontSize: 16, color: Colors.blue),),
              Buttons(
                btnName: '8:00 AM',
                height: 70.0,
              ),
              Text(
                'YOU ARE CHECKED OUT AT',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              Buttons(btnName: '8:00 PM',
                height: 70.0,
              ),
             Padding(padding: EdgeInsets.all(10)),
              Text(
                'HAVE A GOOD EVENING \n SEE YOU TOMORROW',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
               Padding(padding: EdgeInsets.all(30.0)),
              Buttons( 
                btnName: 'DONE',
                width: 300.0,
                height: 70.0,
                page: StartingPage(),
              )
            ],
          
    );
  }
}
