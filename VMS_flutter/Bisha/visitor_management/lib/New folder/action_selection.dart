// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/main.dart';
import 'buttons.dart';
import 'checkin.dart';
import 'day_off.dart';
import 'other.dart';

class actionselection extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
                children: [
                Buttons(
                btnName: "CHECK IN",
                btnColor: Colors.white,
                 txtColor: Colors.blueAccent,
                width: 420,
                height: 70,
                page: ActionPage(checkin)),
            Buttons(
                btnName: "CHECK OUT",
                btnColor: Colors.white,
                 txtColor: Colors.blueAccent,
                width: 420,
                height: 70,
                page: ActionPage(checkin),),
                
           Buttons(
                btnName: "REQUEST DAY OFF",
                btnColor: Colors.white,
                 txtColor: Colors.blueAccent,
                width: 420,
                height: 70,
                page: ActionPage(dayoff)),
           
          
          Buttons(
                btnName: "OTHER",
                btnColor: Colors.white,
                 txtColor: Colors.blueAccent,
                width: 420,
                height: 70,
                page: ActionPage(other)),]
           
      ),
    );
  }
}