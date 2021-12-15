// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:visitor_management/home.dart';
// import 'package:visitor_management/index.dart';

PreferredSizeWidget appBars() {
  return AppBar(
    title: Header(),
    centerTitle: true,
    backgroundColor: Colors.white10,
    foregroundColor: Colors.blue.shade500,
    elevation: 0.0, // Remove shadow
  );
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Text(
        'KABBEE',
        style: TextStyle(
          fontSize: 27.0,
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  // const Headline({Key? key}) : super(key: key);
  String info;
  double buttom;
  Headline(this.info, this.buttom);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, buttom),
      child: Text(
        info,
        style: TextStyle(
          color: Colors.blue.shade500,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

class Divide extends StatelessWidget {
  double width;
  Divide(this.width);
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width,
      child: Divider(
        thickness: 1.3,
        color: Colors.blue.shade500,
      ),
    );
  }
}
