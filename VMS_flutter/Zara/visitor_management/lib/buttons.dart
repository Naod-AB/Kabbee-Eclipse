// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:visitor_management/actionselection.dart';

//Option selection Button Kidane's Code
class Soption extends StatelessWidget {
  //const Soption({ Key? key }) : super(key: key);
  final String opti;
  dynamic page;
  Soption(this.opti, this.page);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },

      height: 55.0,
      minWidth: 260.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(opti, style: TextStyle(fontSize: 17)),
      // splashColor: Colors.blue.shade500,
    );
  }
}

//Name List and action selection buttons Esrom's & Merry's Code
class Nbtn extends StatelessWidget {
  // const Nbtn({Key? key}) : super(key: key);
  String sss;
  double width;
  double height;
  double font;
  dynamic page;
  Nbtn(this.sss, this.width, this.height, this.font, this.page);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(sss),
      style: OutlinedButton.styleFrom(
          textStyle: TextStyle(fontSize: font),
          fixedSize: Size(width, height),
          side: BorderSide(width: 1, color: Colors.blue)),
    );
  }
}

//Code for check in and out time Hani's Code
class HaniTime extends StatelessWidget {
  //const NameTime({ Key? key }) : super(key: key);
  final String time;
  HaniTime(this.time);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade500,
          ),
        ),
      ),
    );
  }
}
