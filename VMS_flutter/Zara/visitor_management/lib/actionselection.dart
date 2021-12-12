// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/allbuttons.dart';
import 'package:visitor_management/checkin.dart';
import 'package:visitor_management/checkout.dart';
import 'package:visitor_management/day_off.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/other.dart';

class Actionselector extends StatelessWidget {
  const Actionselector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(
          width: 1.0,
          color: Colors.blueAccent,
        )),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Text(
                'KABBEE',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divide(0.28),
              SizedBox(height: 35.0),
              Headline('PLEASE SELECT ONE OF THE FOLLOW OPTION', 10.0),
              SizedBox(height: 35.0),
              Column(
                children: [
                  Nbtn('CHECK IN', 350, 50, 13, checkin()),
                  SizedBox(height: 35.0),
                  Nbtn('CHECK OUT', 350, 50, 13, checkout()),
                  SizedBox(height: 35.0),
                  Nbtn('REQUEST DAY OFF', 350, 50, 13, Dayoff()),
                  SizedBox(height: 35.0),
                  Nbtn('OTHER', 350, 50, 13, Other()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
