// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import './time.dart';
import 'buttons.dart';
import 'check.dart';
import 'names.dart';
import 'template.dart';
import 'package:visitor_management/variable.dart';

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
    timeGreet;
  }

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
                  Text(
                    'No Users Found ',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                    textAlign: TextAlign.center,
                  )
                ]
              : adminNames
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        setState(() {
                          updateCheckin();
                          name.checkin = time;
                          adminCheckout.add(name);
                          adminNames.remove(name);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Template(
                                    Checkin(
                                      userName: name.name,
                                      timeGreet: timeGreet,
                                      time: time,
                                    ),
                                    subheadernone,
                                    50,
                                    widthfactorshort),
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
                      Text(
                        'No Users Found ',
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                        textAlign: TextAlign.center,
                      )
                    ]
                  : studentNames
                      .map((name) => NameButtons(
                          myname: name,
                          delete: () {
                            setState(() {
                              updateCheckin();
                              name.checkin = time;
                              studentCheckout.add(name);
                              studentNames.remove(name);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Template(
                                        Checkin(
                                          userName: name.name,
                                          timeGreet: timeGreet,
                                          time: time,
                                        ),
                                        subheadernone,
                                        50,
                                        widthfactorshort),
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
                  Text(
                    'No Users Found ',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                    textAlign: TextAlign.center,
                  )
                ]
              : staffNames
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        setState(() {
                          updateCheckin();
                          name.checkin = time;
                          staffCheckout.add(name);
                          staffNames.remove(name);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Template(
                                    Checkin(
                                      userName: name.name,
                                      timeGreet: timeGreet,
                                      time: time,
                                    ),
                                    subheadernone,
                                    50,
                                    widthfactorshort),
                              ));
                        });
                      }))
                  .toList(),
        ),
      ),
    );
  }
}
