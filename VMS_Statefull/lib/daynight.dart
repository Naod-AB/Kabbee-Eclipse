import 'package:intl/intl.dart';

String daynight = dayNight();

String dayNight() {
  var now = DateTime.now();
  bool dayOrNight = now.hour > 6 && now.hour < 11 ? true : false;
  String bgI = dayOrNight ? 'day.jpg' : 'night.jpg';
  return bgI;
}

