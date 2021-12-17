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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Nbtn(
                'ADMIN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'ARKAN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'MARTHA',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'YEMANE',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'EVEN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SAMUEL',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'FITSUM',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SAMUEL',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'AHLEM',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SEGEN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'RODAS',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Nbtn(
                'STUDENT',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'ARKAN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'MARTHA',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'YEMANE',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'EVEN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SAMUEL',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'FITSUM',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SAMUEL',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'AHLEM',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SEGEN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'RODAS',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Nbtn(
                'STAFF',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'ARKAN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'MARTHA',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'YEMANE',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'EVEN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SAMUEL',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'FITSUM',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SAMUEL',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'AHLEM',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'SEGEN',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
            SizedBox(height: 15.0),
            Nbtn(
                'RODAS',
                Template(Actionselector(),
                    "PLEASE SELECT ONE OF THE FOLLOWING OPTION", 40, 0.7)),
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
            Btn('DONE', 200, 60, 25,
                Template(SelectOption(), "PLEASE SELECT ONE OPTION", 50, 0.7)),
          ],
        ),
      ),
    );
  }
}
