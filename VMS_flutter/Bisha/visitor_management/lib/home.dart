// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'template.dart';
import 'selection.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: StartingPage()));
}

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000.0,
        margin: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.5),
        ),
        child: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ActionPage(OptionSelect(), "PLEASE SELECT ONE OPTION", 0.7),
              ),
            ),
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 200.0),
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
                    padding: EdgeInsets.only(top: 60.0),
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
                    padding: EdgeInsets.only(top: 180.0),
                    width: MediaQuery.of(context).size.width * 0.3,
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
