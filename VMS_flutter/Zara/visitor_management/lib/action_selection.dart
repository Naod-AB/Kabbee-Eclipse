// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/check_in.dart';
import 'package:visitor_management/check_out.dart';
import 'package:visitor_management/day_off.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/other.dart';
import 'package:visitor_management/template.dart';

class Actionselector extends StatelessWidget {
  const Actionselector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Divide(0.33),
          Headline('PLEASE SELECT ONE OF THE FOLLOW OPTION', 10.0),
          Btn('CHECK IN', 350, 50, 13, Template(checkin())),
          SizedBox(height: 35.0),
          Btn('CHECK OUT', 350, 50, 13, Template(checkout())),
          SizedBox(height: 35.0),
          Btn('REQUEST DAY OFF', 350, 50, 13, Template(Dayoff())),
          SizedBox(height: 35.0),
          Btn('OTHER', 350, 50, 13, Template(Other())),
        ],
      ),
    );
  }
}
