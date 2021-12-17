// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(100.0),
      child: Column(children: [
        SpinKitRing(color: Colors.blue.shade600, size: 60.0),
        SizedBox(height: 20.0),
        Text("please wait .....",
            style: TextStyle(color: Colors.blue[600], fontSize: 20.0)),
      ]),
        ),
        ),
    );
  }
}
