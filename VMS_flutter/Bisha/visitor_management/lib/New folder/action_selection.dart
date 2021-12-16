// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/checkin_1.dart';
import 'package:visitor_management/New%20folder/checkout.dart';
import 'package:visitor_management/New%20folder/main.dart';
import 'buttons.dart';
import 'day_off.dart';
import 'other.dart';

class ActionSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(120.0),
      child: Column(children: [
        Buttons(
            btnName: "CHECK IN",
            btnColor: Colors.white,
            txtColor: Colors.blueAccent,
            width: 420,
            height: 70,
            page: ActionPage(Checkin1(),"",0.33)),
        Buttons(
          btnName: "CHECK OUT",
          btnColor: Colors.white,
          txtColor: Colors.blueAccent,
          width: 420,
          height: 70,
          page: ActionPage(Checkout(),"",0.33),
        ),
        Buttons(
            btnName: "REQUEST DAY OFF",
            btnColor: Colors.white,
            txtColor: Colors.blueAccent,
            width: 420,
            height: 70,
            page: ActionPage(Dayoff(),"",0.33)),
        Buttons(
            btnName: "OTHER",
            btnColor: Colors.white,
            txtColor: Colors.blueAccent,
            width: 420,
            height: 70,
            page: ActionPage(Other(),"",0.33)),
      ]),
    );
  }
}
