import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';

import 'package:visitor_management/selection.dart';
import 'package:visitor_management/template.dart';

class Checkin extends StatelessWidget {
  const Checkin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
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

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
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
        Btn('DONE', 250, 60, 25, Template(SelectOption())),
      ],
      //     ),
      //   ),
    );
  }
}
