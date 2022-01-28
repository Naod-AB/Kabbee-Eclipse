// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visitor_management/variable.dart';
import 'home.dart';
import 'listout.dart';
import 'name_list.dart';
import 'selection.dart';
import 'template.dart';
import 'time.dart';

bool _light =
    DateTime.now().hour > 6 && DateTime.now().hour < 23 ? true : false;

void main() {
  runApp(MaterialApp(
    theme: _light ? LightTheme : DarkTheme,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (Context) => Home(),
      '/selection': (Context) =>
          Template(SelectOption(), subheaderoption, width50, widthfactorlong),
      '/adminin': (Context) =>
          Template(AdminList(), subheadername, width40, widthfactorlong),
      '/adminout': (Context) =>
          Template(AdminOut(), subheadername, width40, widthfactorlong),
      '/staffin': (Context) =>
          Template(StaffList(), subheadername, width40, widthfactorlong),
      '/staffout': (Context) =>
          Template(StaffOut(), subheadername, width40, widthfactorlong),
      '/studentin': (Context) =>
          Template(StudentList(), subheadername, width40, widthfactorlong),
      '/studentout': (Context) =>
          Template(StudentOut(), subheadername, width40, widthfactorlong),
    },
  ));
}
