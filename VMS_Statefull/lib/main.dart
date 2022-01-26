// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visitor_management/daynight.dart';
import 'check.dart';
import 'listout.dart';
import 'name_list.dart';
import 'selection.dart';
import 'template.dart';
import 'daynight.dart';

String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";
String passing = "";
double x = 50;
double y = 40;
double z = 0.7;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (Context) => Home(),
      '/selection': (Context) => Template(SelectOption(), message, x, z),
      // '/action': (Context) => Template(Actionselector(), message, x, z),
      '/adminin': (Context) => Template(AdminList(), message, y, z),
      '/adminout': (Context) => Template(AdminOut(), message, y, z),
      '/staffin': (Context) => Template(StaffList(), message, y, z),
      '/staffout': (Context) => Template(StaffOut(), message, y, z),
      '/studentin': (Context) => Template(StudentList(), message, y, z),
      '/studentout': (Context) => Template(StudentOut(), message, y, z),
      '/staff': (Context) => Template(StaffList(), message, y, z),
      '/student': (Context) => Template(StudentList(), message, y, z),
      '/checkin': (Context) => Template(Checkin(), message, y, z), // done
      '/checkout': (Context) => Template(Checkout(), message, y, z),
    },
  ));
}

// Done Except day and night feature
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$daynight'), fit: BoxFit.cover),
                border: Border.all(color: Colors.blue, width: 2.0)),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/selection');
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
