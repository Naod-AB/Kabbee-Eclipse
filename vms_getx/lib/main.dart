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
      GetPage(name: '/', page: () => const Home()),
      GetPage(
          name: '/selection',
          page: () => Template(
              const SelectOption(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/actionSelection',
          page: () => Template(
              Actionselector(), subheadertxt, width40, widthfactorshort)),
      GetPage(
          name: '/adminin',
          page: () => Template(
              const AdminList(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/adminout',
          page: () => Template(
              const AdminOut(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/staffin',
          page: () => Template(
              const StaffList(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/staffout',
          page: () => Template(
              const StaffOut(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/studentin',
          page: () => Template(
              const StudentList(), subheaderoption, width50, widthfactorlong)),
      GetPage(
          name: '/studentout',
          page: () => Template(
              const StudentOut(), subheaderoption, width50, widthfactorlong)),
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
  static final light = ThemeData.light().copyWith();
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: Colors.blue,
  );
}
