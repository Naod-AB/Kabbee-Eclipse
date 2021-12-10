

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/mbutton.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue.shade500),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'KABEE',
              textScaleFactor: 1.4,
              
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue.shade500,
            elevation: 0.0, // Remove shadow
          ),
          body: Container(
            color: Colors.white,
            child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FractionallySizedBox(
                    widthFactor: 0.7,
                 child: Divider(
                      thickness: 1.6,
                      color: Colors.blue, 
                     ),
                  ),
                SizedBox(
                  height: 20.0, // to create a space between two elements
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                  child: Text(
                    "PLEASE SELECT ONE OPTION",
                    style: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 15.0,
                    ),
                    
                  ),
                ),
                Soption('VISITOR'),
                SizedBox( height: 23.0,),
                 Soption('STUDENT'),
                SizedBox(height: 23.0,),
                 Soption('STAFF'),
                SizedBox(height: 23.0,),
                 Soption('ADMINISTRATOR'),
                SizedBox(height: 23.0,), 
              ],
              ), 
                ),
            ),
          ),
          ),
          );
  }
}
