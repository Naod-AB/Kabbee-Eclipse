// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Nbtn extends StatelessWidget {
  //const Nbtn({Key? key}) : super(key: key);
  final String sss;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Nbtn(this.sss);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(sss),
      style: OutlinedButton.styleFrom(
          fixedSize: Size(300, 35),
          side: BorderSide(width: 1, color: Colors.blue)),
    );
  }
}
