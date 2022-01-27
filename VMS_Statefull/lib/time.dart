import 'package:intl/intl.dart';

dynamic time;
dynamic times;
dynamic timeGreet;
bool? isDay;

clock() {
  return DateFormat.jm().format(DateTime.now());
}

var checkinTime = clock();
var checkoutTime = clock();

updateCheckin(e) {
  checkinTime = DateFormat.jm().format(DateTime.now());
  time = checkinTime;
}

updateCheckOut(saved) {
  checkoutTime = DateFormat.jm().format(DateTime.now());
  time = saved;
}

greet() {
  String savedTime = checkinTime.toLowerCase();

  // get hour only
  String time = savedTime.substring(0, 2);

  if (time.contains(':')) {
    time = savedTime.substring(0, 1);
  }
  var timees = int.parse(time);

  // check daytime

  if (timees <= 12 && savedTime.contains('AM'.toLowerCase())) {
    isDay = true;
    timeGreet = 'GOOD MORNING';
  } else if (timees >= 6 &&
      timees < 12 &&
      savedTime.contains('PM'.toLowerCase())) {
    isDay = false;
    timeGreet = 'GOOD EVENING';
  } else if (timees < 6 ||
      timees == 12 && savedTime.contains('PM'.toLowerCase())) {
    isDay = true;
    timeGreet = 'GOOD AFTERNOON';
  }
}
