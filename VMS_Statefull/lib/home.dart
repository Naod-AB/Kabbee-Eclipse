// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/check.dart';
import 'package:visitor_management/name_list.dart';
import 'package:visitor_management/selection.dart';
import 'package:visitor_management/template.dart';

String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";

// void main() => runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     ));

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (Context) => Home(),
      '/selection': (Context) => Template(SelectOption(), message, 50, 0.7),
      '/action': (Context) => Template(Actionselector(), message, 50, 0.7),
      '/admin': (Context) => Template(AdminList(), message, 40, 0.7),
      '/staff': (Context) => Template(StuffList(), message, 40, 0.7),
      '/student': (Context) => Template(StudentList(), message, 40, 0.7),
      '/checkin': (Context) => Template(Checkin(), message, 40, 0.7),
      '/checkout': (Context) => Template(Checkout(), message, 40, 0.7),
    },
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0)),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Template(SelectOption(), message, 50, 0.7),
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
                        const SizedBox(height: 40.0),
                        const Text(
                          'WE ARE HAPPY TO HAVE YOU HERE!',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 100.0,
                        ),
                        const Text(
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
