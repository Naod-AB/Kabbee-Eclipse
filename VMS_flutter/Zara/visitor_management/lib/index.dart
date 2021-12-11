// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:visitor_management/allbuttons.dart';
import 'package:visitor_management/select.dart';
// import 'package:visitor_management/selection.dart';

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
    return FractionallySizedBox(
      widthFactor: 0.95,
      heightFactor: 0.95,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SelectOption()));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.blue.shade500),
          ),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading:
                  false, // to make the back arrow in home disappear
              backgroundColor: Colors.white10,
              foregroundColor: Colors.blue.shade500,
              elevation: 0.0, // Remove shadow
            ),
            body: Center(
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 80.0, // to create a space between two elements
                    ),
                    Text(
                      "WELCOME TO KABBEE CAMPUS",
                      style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50.0, // to create a space between two elements
                    ),
                    FittedBox(
                      child: Text(
                        "WE ARE HAPPY YOU ARE HERE!",
                        style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150.0, // to create a space between two elements
                    ),
                    Text(
                      "TOUCH THE SCREEN TO START",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
