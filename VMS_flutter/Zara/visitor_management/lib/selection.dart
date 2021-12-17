import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/check.dart';
import 'package:visitor_management/day_off.dart';
import 'package:visitor_management/name_list.dart';
import 'package:visitor_management/other.dart';
import 'package:visitor_management/template.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Soption('VISITOR',
                Template(Visitor(), "PLEASE ENTER YOUR NAME", 50, 0.7)),
            SizedBox(
              height: 30,
            ),
            Soption('STUDENT',
                Template(StudentList(), "PLEASE SELECT YOUR NAME", 20, 0.7)),
            SizedBox(
              height: 30,
            ),
            Soption('STAFF',
                Template(StuffList(), "PLEASE SELECT YOUR NAME", 20, 0.7)),
            SizedBox(
              height: 30,
            ),
            Soption('ADMINISTRATOR',
                Template(AdminList(), "PLEASE SELECT YOUR NAME", 20, 0.7)),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class Actionselector extends StatelessWidget {
  const Actionselector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: const [
            Btn('CHECK IN', 350, 50, 13, Template(Checkin(), "", 50, 0.7)),
            SizedBox(height: 35.0),
            Btn('CHECK OUT', 350, 50, 13, Template(Checkout(), "", 50, 0.7)),
            SizedBox(height: 35.0),
            Btn('REQUEST DAY OFF', 350, 50, 13,
                Template(Dayoff(), "PLEASE SELECT DAY OFF", 30, 0.7)),
            SizedBox(height: 35.0),
            Btn('OTHER', 350, 50, 13,
                Template(Other(), "COMPANY REVIEW", 50, 0.7)),
          ],
        ),
      ),
    );
  }
}
