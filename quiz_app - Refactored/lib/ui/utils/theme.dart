import 'package:flutter/material.dart';

// Dark mode
const pColor = Color(0XFFFCA401);
const appbarColorDark = Color(0xFF111111);
const bgColorDark = Color(0xFF000000);

// const darkThemeAccent = Color.fromRGBO(255, 165, 0, 1);
const darkThemeBody = Color.fromARGB(255, 1, 0, 0);
const darkThemeLogin = Color.fromRGBO(40, 40, 40, 1);
const darkThemeAppbar = Color.fromRGBO(16, 16, 16, 1);
// const primaryColorDark = lightThemeBody;

// const lightThemeAccent = Color.fromRGBO(255, 178, 36, 1);
const lightThemeBody = Color.fromRGBO(237, 237, 237, 1);
const lightThemeLogin = Color.fromRGBO(255, 255, 255, 1);
const lightThemeAppbar = Color.fromRGBO(237, 237, 237, 1);
// const primaryColorLight = darkThemeBody;

// const textColor = Color(0xFFFFFFFF);
// light mode
// const appbarColorLight = Color(0xFF111111);
// const bgColorLight = Color.fromRGBO(237, 237, 237, 1);
// final ThemeData base = ThemeData(
//   scaffoldBackgroundColor: lightThemeBody,
//   appBarTheme: appbarTheme(),
// );

class Themes {
  static final darkMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkThemeBody,
    primaryColor: lightThemeBody,
    shadowColor: darkThemeLogin,
    // colorScheme: ColorScheme(brightness: Brightness.dark, primary: darkThemeBody, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
    textTheme: const TextTheme(
      headline4: TextStyle(color: lightThemeBody),
      headline5: TextStyle(color: lightThemeBody),
      headline6: TextStyle(color: lightThemeBody),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: darkThemeAppbar, foregroundColor: lightThemeAppbar),
  );
  static final lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightThemeBody,
    primaryColor: darkThemeBody,
    shadowColor: lightThemeLogin,
    textTheme: const TextTheme(
      headline4: TextStyle(color: darkThemeBody),
      headline5: TextStyle(color: darkThemeBody),
      headline6: TextStyle(color: darkThemeBody),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: lightThemeAppbar, foregroundColor: darkThemeAppbar),
  );
}

// ThemeData quizAppTheme() {
//   final ThemeData base = ThemeData(
//     scaffoldBackgroundColor: lightThemeBody,
//     appBarTheme: appbarTheme(),
//   );

//   return base.copyWith(
//     textTheme: _customizeTextTheme(base.textTheme),
//     primaryTextTheme: _customizeTextTheme(base.primaryTextTheme),
//     //accentTextTheme: _customizeTextTheme(base.accentTextTheme),
//   );
// }

// AppBarTheme appbarTheme() {
//   return const AppBarTheme(backgroundColor: primaryColorLight);
// }

// TextTheme _customizeTextTheme(TextTheme base) {
//   return base.copyWith(
//       bodyText1: const TextStyle(color: primaryColorLight),
//       bodyText2: const TextStyle(color: primaryColorLight),
//       headline1: const TextStyle(
//         color: primaryColorLight,
//         fontSize: 30,
//         fontWeight: FontWeight.bold,
//       ));
// }

const double defaultPadding = 16;
// const pColor = Color(0XFFFCA401);
// const appbarColor = Color(0xFF111111);
// const bgColorDark = Color(0xFF000000);
// const textColor = Color(0xFFFFFFFF);
