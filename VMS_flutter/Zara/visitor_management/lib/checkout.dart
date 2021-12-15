// ignore_for_file: file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management/allbuttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/select.dart';
import 'package:visitor_management/template.dart';

class checkout extends StatelessWidget {
  const checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 15.0),
        // Text(
        //   'KABBEE',
        //   style: TextStyle(
        //     fontSize: 25.0,
        //     color: Colors.blue.shade400,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        SizedBox(height: 15.0),
        Divide(0.33),
        SizedBox(height: 120.0),
        Headline('YOU ARE CHECK IN AT', 0.0),
        HaniTime('7:45 AM'),
        SizedBox(height: 30.0),
        Headline('YOU ARE CHECK OUT AT', 0.0),
        HaniTime('6:00 PM'),
        SizedBox(height: 30),
        Headline('HAVE A GOOD EVENING', 0.0),
        Headline('SEE YOU TOMORROW', 0.0),
        SizedBox(height: 50.0),
        Nbtn('DONE', 250, 60, 25, Template(SelectOption())),
      ],
      //     ),
      //   ),
    );
  }
}
