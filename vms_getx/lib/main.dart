// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'check.dart';
import 'variable.dart';
import 'home.dart';
import 'listout.dart';
import 'name_list.dart';
import 'selection.dart';
import 'template.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    theme: Themes.light,
    darkTheme: Themes.dark,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => Home()),
      GetPage(
          name: '/selection',
          page: () => Template(
              SelectOption(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/actionSelection',
          page: () => Template(
              Actionselector(), subheadertxt, width40, widthfactorshort)),
      GetPage(
          name: '/adminin',
          page: () =>
              Template(AdminList(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/adminout',
          page: () =>
              Template(AdminOut(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/staffin',
          page: () =>
              Template(StaffList(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/staffout',
          page: () =>
              Template(StaffOut(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/studentin',
          page: () => Template(
              StudentList(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/studentout',
          page: () => Template(
              StudentOut(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/checkin',
          page: () =>
              Template(Checkin(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/checkout',
          page: () =>
              Template(Checkout(), subheaderoption, width50, widthfactorlong)),
    ],
  ));
}

class Themes {
  static final light = ThemeData.light().copyWith(
      //buttonColor: Colors.blue,

      );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: Colors.blue,
  );
}
