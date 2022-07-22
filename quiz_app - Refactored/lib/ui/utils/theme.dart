import 'package:flutter/material.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

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

class DarkModeColors {
  static const onPrimaryColor = Colors.black87;
  static const backgroundColor = Color(0xFF121212);
  static const backgroundVariant = Color(0xFF1F1F1F);
  static const onBackgroundColor = Color(0xDEFFFFFF);

  static const onBackgroundLightColor = Color(0x99FFFFFF);
  static const surfaceColor = Color(0xFF2b2b2b);
  static final onSurfaceColor = Colors.white.withOpacity(0.87);
  static const borderColor = Colors.white24;
  static const errorColor = Color(0xFFB00020);
}

class LightModeColors {
  static const onPrimaryColor = Colors.black87;
  static final backgroundColor = Colors.grey.shade200;
  static final backgroundVariant = Colors.grey.shade100;
  static const onBackgroundColor = Colors.black87;
  static final onBackgroundLightColor = Colors.black.withOpacity(0.60);
  static const surfaceColor = Colors.white;
  static const onSurfaceColor = Colors.black87;
  static const borderColor = Colors.black26;
  static const errorColor = Color(0xFFB00020);
}

class Themes {
  static ThemeData darkMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkThemeBody,
    primaryColor: lightThemeBody,
    shadowColor: darkThemeLogin,
    colorScheme: ColorScheme(
      background: DarkModeColors.backgroundColor,
      onBackground: DarkModeColors.onBackgroundColor,
      brightness: Brightness.dark,
      error: DarkModeColors.errorColor,
      onError: DarkModeColors.onBackgroundLightColor,
      // onPrimary: DarkModeColors.onPrimaryColor,
      onPrimary: lightThemeBody,
      secondary: DarkModeColors.backgroundVariant,
      onSecondary: DarkModeColors.onBackgroundColor,
      surface: DarkModeColors.surfaceColor,
      onSurface: Colors.red,
      primary: kblue,
      // shadow: darkThemeLogin,
    ),
    // colorScheme: ColorScheme(brightness: Brightness.dark, primary: darkThemeBody, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
    textTheme: const TextTheme(
      headline4: TextStyle(color: lightThemeBody),
      headline5: TextStyle(color: lightThemeBody),
      headline6: TextStyle(color: lightThemeBody),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: darkThemeAppbar, foregroundColor: lightThemeAppbar),
  );
  static ThemeData lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightThemeBody,
    primaryColor: darkThemeBody,
    shadowColor: lightThemeLogin,
    textTheme: const TextTheme(
      headline4: TextStyle(color: darkThemeBody),
      headline5: TextStyle(color: darkThemeBody),
      headline6: TextStyle(color: darkThemeBody),
    ),
    colorScheme: ColorScheme(
      background: LightModeColors.backgroundColor,
      onBackground: LightModeColors.onBackgroundColor,
      brightness: Brightness.light,
      error: LightModeColors.errorColor,
      onError: LightModeColors.onBackgroundLightColor,
      onPrimary: darkThemeBody,
      // onPrimary: LightModeColors.onPrimaryColor,
      secondary: LightModeColors.backgroundVariant,
      onSecondary: LightModeColors.onBackgroundColor,
      surface: LightModeColors.surfaceColor,
      onSurface: Colors.blue,
      primary: kblue,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: lightThemeAppbar, foregroundColor: darkThemeAppbar),
  );
}

// colorScheme: ColorScheme(
//           background: DarkModeColors.backgroundColor,
//           onBackground: DarkModeColors.onBackgroundColor,
//           brightness: Brightness.dark,
//           error: DarkModeColors.errorColor,
//           onError: DarkModeColors.onBackgroundLightColor,
//           onPrimary: DarkModeColors.onPrimaryColor,
//           secondary: DarkModeColors.backgroundVariant,
//           onSecondary: DarkModeColors.onBackgroundColor,
//           surface: DarkModeColors.surfaceColor,
//           onSurface: DarkModeColors.onSurfaceColor,
//           primary: KpColors.primaryColor,
//         ),

const double defaultPadding = 16;
