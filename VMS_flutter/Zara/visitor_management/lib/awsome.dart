// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management/stufflist.dart';

void main() {
  runApp(
    MaterialApp(
      home: Awesome(),
    ),
  );
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text("testttt");
//   }
// }

class Awesome extends StatelessWidget {
  const Awesome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StuffList()));
            },
            child: Container(
              width: 1240,
              height: 580,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue, width: 1, style: BorderStyle.solid)),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 150, 50, 50),
                      child: Text(
                        "WELCOME TO KABBEE CAMPUS",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        "WE ARE HAPPY TO HAVE YOU HERE!",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 29,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
                      child: Text(
                        'TOUCH THE SCREEN TO START',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    )
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
