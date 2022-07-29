import 'package:flutter/material.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

const pColor = Color(0XFFFCA401);
const appbarColorDark = Color(0xFF111111);
const bgColorDark = Color(0xFF000000);

const darkThemeBody = Color.fromARGB(255, 1, 0, 0);
const darkThemeLogin = Color.fromRGBO(40, 40, 40, 1);
const darkThemeAppbar = Color.fromRGBO(16, 16, 16, 1);

const lightThemeBody = Color.fromRGBO(237, 237, 237, 1);

const lightThemeAppbar = Color.fromARGB(255, 224, 223, 223);

class DarkModeColors {
  static const onPrimaryColor = Colors.black87;
  static const backgroundColor = Color.fromARGB(255, 1, 0, 0);
  static const backgroundVariant = Color.fromARGB(255, 31, 31, 31);
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
    shadowColor: darkThemeLogin,
    colorScheme: const ColorScheme(
      tertiary: DarkModeColors.backgroundVariant,
      background: DarkModeColors.backgroundColor,
      onBackground: DarkModeColors.onBackgroundColor,
      brightness: Brightness.dark,
      error: DarkModeColors.errorColor,
      onError: DarkModeColors.onBackgroundLightColor,
      onPrimary: lightThemeBody,
      primary: kblue,
      secondary: kblue,
      onSecondary: DarkModeColors.onBackgroundColor,
      surface: DarkModeColors.surfaceColor,
      onSurface: DarkModeColors.onBackgroundColor,
    ),
    textTheme: const TextTheme(
      headline4: TextStyle(color: lightThemeBody),
      headline5: TextStyle(color: lightThemeBody),
      headline6: TextStyle(
          color: DarkModeColors.onBackgroundColor, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: darkThemeAppbar, foregroundColor: lightThemeAppbar),
  );
  static ThemeData lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightThemeBody,
    textTheme: const TextTheme(
      headline4: TextStyle(color: darkThemeBody),
      headline5: TextStyle(color: darkThemeBody),
      headline6: TextStyle(
          color: DarkModeColors.onBackgroundColor, fontWeight: FontWeight.bold),
    ),
    colorScheme: ColorScheme(
      background: LightModeColors.backgroundColor,
      onBackground: LightModeColors.onBackgroundColor,
      brightness: Brightness.light,
      error: LightModeColors.errorColor,
      onError: LightModeColors.onBackgroundLightColor,
      onPrimary: darkThemeBody,
      primary: kblue,
      secondary: LightModeColors.backgroundVariant,
      onSecondary: LightModeColors.onBackgroundColor,
      surface: LightModeColors.surfaceColor,
      onSurface: LightModeColors.onBackgroundColor,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: lightThemeAppbar, foregroundColor: darkThemeAppbar),
  );
}

const double defaultPadding = 16;
