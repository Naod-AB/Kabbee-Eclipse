// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:visitor_management/option_selection.dart';
import 'package:visitor_management/template.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0)),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Template(SelectOption()),
                    ),
                  );
                },
                child: Center(
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WELCOME TO KABBEE CAMPUS',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[400],
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          'WE ARE HAPPY TO HAVE YOU HERE!',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        Text(
                          'TOUCH THE SCREEN TO START',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
