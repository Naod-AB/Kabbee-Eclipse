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
        ActionButtons(
            btnName: "CHECK IN",
            page: ActionPage(Checkin1(),"",0.33)),
        ActionButtons(
          btnName: "CHECK OUT",
          page: ActionPage(Checkout(),"",0.33),
        ),
        ActionButtons(
            btnName: "REQUEST DAY OFF",
            page: ActionPage(Dayoff(),"",0.33)),
        ActionButtons(
            btnName: "OTHER",
            page: ActionPage(Other(),"",0.33)),
      ]),
    );
  }
}
