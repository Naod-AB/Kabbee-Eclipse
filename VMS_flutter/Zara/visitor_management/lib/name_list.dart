import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/selection.dart';
import 'package:visitor_management/template.dart';

class AdminList extends StatelessWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Divide(0.7),
            Headline("PLEASE SELECT YOUR NAME", 50.0),
            Nbtn('ADMIN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('EVEN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('RODAS', Template(Actionselector())),
          ],
        ),
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Divide(0.7),
            Headline("PLEASE SELECT YOUR NAME", 50.0),
            Nbtn('STUDENT', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('EVEN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('RODAS', Template(Actionselector())),
          ],
        ),
      ),
    );
  }
}

class StuffList extends StatelessWidget {
  const StuffList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Divide(0.7),
            Headline("PLEASE SELECT YOUR NAME", 50.0),
            Nbtn('STAFF', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('ARKAN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('MARTHA', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('YEMANE', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('EVEN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('FITSUM', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SAMUEL', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('AHLEM', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('SEGEN', Template(Actionselector())),
            SizedBox(height: 15.0),
            Nbtn('RODAS', Template(Actionselector())),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Divide(0.7),
            Headline("PLEASE ENTER YOUR NAME", 50.0),
            SizedBox(height: 100.0),
            FractionallySizedBox(
              widthFactor: 0.3,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                  labelText: 'YOUR NAME',
                ),
              ),
            ),
            SizedBox(height: 100.0),
            Btn('DONE', 250, 60, 25, Template(SelectOption())),
          ],
        ),
      ),
    );
  }
}
