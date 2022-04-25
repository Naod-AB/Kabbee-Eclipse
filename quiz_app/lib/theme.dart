import 'package:flutter/material.dart';
//import 'package:quez_app/constants.dart';

import 'constants.dart';

ThemeData quizAppTheme() {
  const pColor = Color(0XFFFCA401);
  const appbarColor = Color(0xFF111111);
  const bgColor = Color(0xFF000000);
  const textColor = Color(0xFFFFFFFF);
  final ThemeData base = ThemeData(
    scaffoldBackgroundColor: bgColor,
    appBarTheme: appbarTheme(),
  );

  return base.copyWith(
    textTheme: _customizeTextTheme(base.textTheme),
    primaryTextTheme: _customizeTextTheme(base.primaryTextTheme),
    //accentTextTheme: _customizeTextTheme(base.accentTextTheme),
  );
}

AppBarTheme appbarTheme() {
  return const AppBarTheme(backgroundColor: appbarColor);
}

TextTheme _customizeTextTheme(TextTheme base) {
  return base.copyWith(
      bodyText1: const TextStyle(color: textColor),
      bodyText2: const TextStyle(color: textColor),
      headline1: const TextStyle(
        color: textColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ));
}
