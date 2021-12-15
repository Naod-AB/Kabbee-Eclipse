// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/header.dart';

import 'package:visitor_management/option_selection.dart';

class Template extends StatelessWidget {
  dynamic specificPage = const SelectOption();
  Template(dynamic inputPage) {
    specificPage = inputPage;
  }

  @override
  Widget build(BuildContext context) {
    //using material instead of scaffold
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade500),
      ),
      child: Scaffold(
        appBar: appBars(),
        body: Center(
          child: Column(
            children: [
              specificPage,
            ],
          ),
        ),
      ),
    );
  }
}
