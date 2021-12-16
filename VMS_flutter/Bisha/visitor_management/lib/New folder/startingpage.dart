// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/main.dart';
import 'package:visitor_management/New%20folder/option_selection.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: StartingPage()));
}

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1.5),
          ),
          child: InkWell(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActionPage(OptionSelect(),"PLEASE SELECT ONE OPTION",0.7),
                ),
              ),
            },
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 200.0),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: FittedBox(
                      child: Text(
                        'WELCOME TO KABBEE CAMPUS',
                        style: TextStyle(
                          fontFamily: 'Verdana',
                          fontSize: 60.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FittedBox(
                      child: Text(
                        'WE ARE HAPPY TO HAVE YOU HERE!',
                        style: TextStyle(
                          fontFamily: 'Verdana',
                          fontSize: 30.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 180.0),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: FittedBox(
                      child: Text(
                        'TOUCH THE SCREEN TO ENTER',
                        style: TextStyle(
                          fontFamily: 'Verdana',
                          fontSize: 20.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
