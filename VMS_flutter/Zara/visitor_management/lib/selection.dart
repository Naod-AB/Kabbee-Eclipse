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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Divide(0.7),
          Headline("PLEASE SELECT ONE OPTION", 50.0),
          Soption('VISITOR', Template(Visitor())),
          SizedBox(
            height: 23.0,
          ),
          Soption('STUDENT', Template(StudentList())),
          SizedBox(
            height: 23.0,
          ),
          Soption('STAFF', Template(StuffList())),
          SizedBox(
            height: 23.0,
          ),
          Soption('ADMINISTRATOR', Template(AdminList())),
          SizedBox(
            height: 23.0,
          ),
        ],
      ),
    );
  }
}

class Actionselector extends StatelessWidget {
  const Actionselector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Divide(0.33),
          Headline('PLEASE SELECT ONE OF THE FOLLOW OPTION', 10.0),
          Btn('CHECK IN', 350, 50, 13, Template(Checkin())),
          SizedBox(height: 35.0),
          Btn('CHECK OUT', 350, 50, 13, Template(Checkout())),
          SizedBox(height: 35.0),
          Btn('REQUEST DAY OFF', 350, 50, 13, Template(Dayoff())),
          SizedBox(height: 35.0),
          Btn('OTHER', 350, 50, 13, Template(Other())),
        ],
      ),
    );
  }
}
