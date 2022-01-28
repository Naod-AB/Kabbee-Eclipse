// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import './time.dart';
import 'check.dart';
import 'names.dart';
import 'buttons.dart';
import 'template.dart';
import 'package:visitor_management/variable.dart';

class AdminOut extends StatefulWidget {
  const AdminOut({Key? key}) : super(key: key);

  @override
  _AdminOutState createState() => _AdminOutState();
}

class _AdminOutState extends State<AdminOut> {
  @override
  void initState() {
    isDay = true;
    greet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children:
              //this is added inorder to change the error
              adminCheckout.isEmpty
                  ? [
                      Text(
                        'No Users Found ',
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                        textAlign: TextAlign.center,
                      )
                    ]
                  : adminCheckout
                      .map((name) => NameButtons(
                          myname: name,
                          delete: () {
                            setState(() {
                              adminNames.add(name);
                              adminCheckout.remove(name);
                              updateCheckOut(name.checkin);
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Template(
                                      Checkout(
                                          userName: name.name,
                                          timeGreetOut: timeGreet,
                                          savedtime: name.checkin,
                                          current: checkoutTime),
                                      subheadernone,
                                      50,
                                      widthfactorshort),
                                ));
                          }))
                      .toList(),
        ),
      ),
    );
  }
}

class StaffOut extends StatefulWidget {
  const StaffOut({Key? key}) : super(key: key);

  @override
  _StaffOutState createState() => _StaffOutState();
}

class _StaffOutState extends State<StaffOut> {
  @override
  void initState() {
    isDay = true;
    greet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: staffCheckout.isEmpty
              ? [
                  Container(
                    child: Text('No Users Found'),
                  )
                ]
              : staffCheckout
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        setState(() {
                          staffNames.add(name);
                          staffCheckout.remove(name);
                          updateCheckOut(name.checkin);
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Template(
                                  Checkout(
                                      userName: name.name,
                                      timeGreetOut: timeGreet,
                                      savedtime: name.checkin,
                                      current: checkoutTime),
                                  subheadernone,
                                  50,
                                  widthfactorshort),
                            ));
                      }))
                  .toList(),
        ),
      ),
    );
  }
}

class StudentOut extends StatefulWidget {
  const StudentOut({Key? key}) : super(key: key);

  @override
  _StudentOutState createState() => _StudentOutState();
}

class _StudentOutState extends State<StudentOut> {
  @override
  void initState() {
    isDay = true;
    greet();
    super.initState();
    timeGreet;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: studentCheckout.isEmpty
              ? [
                  Container(
                    child: Text('No Users Found'),
                  )
                ]
              : studentCheckout
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        setState(() {
                          studentNames.add(name);
                          studentCheckout.remove(name);
                          updateCheckOut(name.checkin);
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Template(
                                  Checkout(
                                      userName: name.name,
                                      timeGreetOut: timeGreet,
                                      savedtime: name.checkin,
                                      current: checkoutTime),
                                  subheadernone,
                                  50,
                                  widthfactorshort),
                            ));
                      }))
                  .toList(),
        ),
      ),
    );
  }
}
