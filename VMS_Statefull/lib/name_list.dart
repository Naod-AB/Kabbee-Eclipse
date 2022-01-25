// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import './time.dart';
import 'buttons.dart';
import 'check.dart';
import 'names.dart';
import 'template.dart';

class AdminList extends StatefulWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  State<AdminList> createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  @override
  void initState() {
    isDay = true;
    greet();
    super.initState();
    timeGreet;
    checkinTime;
  }

  final String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: adminNames.isEmpty
              ? [
                  Container(
                    child: Text('No Users found '),
                  )
                ]
              : adminNames
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        setState(() {
                          updateCheckin(name.checkin);
                          name.checkin = time;
                          adminCheckout.add(name);
                          adminNames.remove(name);

                          //print('IN: ${name.name}, ${name.checkin} ');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Template(
                                    Checkin(
                                      user: name.name,
                                      timeGreet: timeGreet,
                                      time: time,
                                    ),
                                    "PLEASE SELECT ONE OPTION",
                                    50,
                                    0.7),
                              ));
                        });
                      }))
                  .toList(),
        ),
      ),
    );
  }
}

// ........student

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  void initState() {
    isDay = true;
    greet();
    super.initState();
    timeGreet;
  }

  final String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
              //this is added inorder to change the error
              studentNames.isEmpty
                  ? [
                      Container(
                        child: Text('Test'),
                      )
                    ]
                  : studentNames
                      .map((name) => NameButtons(
                          myname: name,
                          delete: () {
                            setState(() {
                              updateCheckin(name.checkin);
                              name.checkin = time;
                              studentCheckout.add(name);
                              studentNames.remove(name);

                             // print('IN: ${name.name}, ${name.checkin} ');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Template(
                                        Checkin(
                                          user: name.name,
                                          timeGreet: timeGreet,
                                          time: time,
                                        ),
                                        "PLEASE SELECT ONE OPTION",
                                        50,
                                        0.7),
                                  ));
                            });
                          }))
                      .toList(),
        ),
      ),
    );
  }
}

class StaffList extends StatefulWidget {
  const StaffList({Key? key}) : super(key: key);

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  @override
  void initState() {
    isDay = true;
    greet();
    super.initState();
    timeGreet;
  }

  final String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: staffNames.isEmpty
              ? [
                  Container(
                    child: Text('Test'),
                  )
                ]
              : staffNames
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        setState(() {
                          updateCheckin(name.checkin);
                          name.checkin = time;
                          staffCheckout.add(name);
                          staffNames.remove(name);

                          //print('IN: ${name.name}, ${name.checkin} ');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Template(
                                    Checkin(
                                      user: name.name,
                                      timeGreet: timeGreet,
                                      time: time,
                                    ),
                                    "PLEASE SELECT ONE OPTION",
                                    50,
                                    0.7),
                              ));
                        });
                      }))
                  .toList(),
        ),
      ),
    );
  }
}
