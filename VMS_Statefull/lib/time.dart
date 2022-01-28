import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/variable.dart';

clock() {
  return DateFormat.jms().format(DateTime.now());
}

var checkinTime = clock();
var checkoutTime = clock();

updateCheckin() {
  checkinTime = DateFormat.jms().format(DateTime.now());
  time = checkinTime;
}

updateCheckOut(savedtime) {
  checkoutTime = DateFormat.jms().format(DateTime.now());
  time = savedtime;
}

greet() {
  String savedTime = checkinTime.toLowerCase();

  // get hour only
  String time = savedTime.substring(0, 2);

  if (time.contains(':')) {
    time = savedTime.substring(0, 1);
  }
  var hour = int.parse(time);

  // check daytime

  if (hour <= 12 && savedTime.contains('AM'.toLowerCase())) {
    isDay = true;
    timeGreet = 'GOOD MORNING';
  } else if (hour >= 6 && hour < 12 && savedTime.contains('PM'.toLowerCase())) {
    isDay = false;
    timeGreet = 'GOOD EVENING';
  } else if (hour < 6 || hour == 12 && savedTime.contains('PM'.toLowerCase())) {
    isDay = true;
    timeGreet = 'GOOD AFTERNOON';
  }
}

ThemeData LightTheme =
    ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);

ThemeData DarkTheme =
    ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue);
