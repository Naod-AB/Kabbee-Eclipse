import 'package:intl/intl.dart';

String daynight = dayNight();

String dayNight() {
  var now = DateTime.now();
  var formattedTime = DateFormat('HH:mm a').format(now).toString();
  bool dyNy = now.hour > 6 && now.hour < 11 ? true : false;
  String bgI = dyNy ? 'day.jpg' : 'night.jpg';
  return bgI;
}

// var now = DateTime.now();
// var formattedTime = DateFormat('HH:mm a').format(now).toString();
