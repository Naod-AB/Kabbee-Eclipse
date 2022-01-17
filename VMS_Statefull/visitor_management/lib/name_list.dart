// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/check.dart';
import 'package:visitor_management/selection.dart';
import 'package:visitor_management/template.dart';

class AdminList extends StatelessWidget {
  final String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String category = data['category'];
    String selected = data['selected'];
    print(selected);
    print(category);

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Nbtn('ADMIN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('EVEN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('RODAS', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Text(data['category']),
            Text(data['selected'])
          ],
        ),
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);
  final String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // The check in class should be dynamic in regards to what the user choose
            Nbtn('STUDENT', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('EVEN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('RODAS', Template(Checkin(), message, 40, 0.7)),
          ],
        ),
      ),
    );
  }
}

class StuffList extends StatelessWidget {
  const StuffList({Key? key}) : super(key: key);
  final String message = "PLEASE SELECT ONE OF THE FOLLOWING OPTIONS";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Btn('CHECK IN', 350, 50, 13, Template(Checkin(), "", 50, 0.7)),
            Nbtn('STAFF', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('EVEN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', Template(Checkin(), message, 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn('RODAS', Template(Checkin(), message, 40, 0.7)),
          ],
        ),
      ),
    );
  }
}

class Visitor extends StatelessWidget {
  const Visitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 100.0),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'YOUR NAME',
                ),
              ),
            ),
            SizedBox(height: 100.0),
            // Btn('DONE', 200, 60, 25,
            //     Template(SelectOption(), "PLEASE SELECT ONE OPTION", 50, 0.7)),
          ],
        ),
      ),
    );
  }
}
