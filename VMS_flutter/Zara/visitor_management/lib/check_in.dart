// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/header.dart';
import 'package:visitor_management/option_selection.dart';
import 'package:visitor_management/template.dart';

class checkin extends StatelessWidget {
  const checkin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divide(0.33),
        SizedBox(height: 120.0),
        Headline('YOU ARE CHECK IN AT', 0.0),
        HaniTime('7:45AM'),
        SizedBox(
          height: 200.0,
        ),
        Btn('DONE', 250, 60, 25, Template(SelectOption())),
      ],
    );
  }
}
