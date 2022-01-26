import 'package:intl/intl.dart';

String daynight = dayNight();

String dayNight() {
  var now = DateTime.now();
  var formattedTime = DateFormat('HH:mm a').format(now).toString();
  bool dayOrNight = now.hour > 6 && now.hour < 11 ? true : false;
  String bgI = dayOrNight ? 'day.jpg' : 'night.jpg';
  return bgI;
}

