//main.dart
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//import 'names.dart';

String subheadertxt = "PLEASE SELECT ONE OF THE FOLLOWING OPTION";
String subheadername = "PLEASE SELECT YOUR NAME";
String subheaderoption = "PLEASE SELECT ONE OPTION";
String subheadernone = "";
double width50 = 50;
double width40 = 40;
double widthfactorlong = 0.7;
double widthfactorshort = 0.33;
bool? isDay;

class TimeController extends GetxController {
  var time = ''.obs;
  var timeGreet = ''.obs;
  var savedtime = ''.obs;
  // var current = ''.obs;

  updateTime() {
    time.value = DateFormat.jms().format(DateTime.now());
  }

  clock() {
    return DateFormat.jms().format(DateTime.now());
  }

  greeting() {
    String savedTime = clock().toLowerCase();

    // get hour only
    String time = savedTime.substring(0, 2);

    if (time.contains(':')) {
      time = savedTime.substring(0, 1);
    }

    var hour = int.parse(time);

    // check daytime

    if (hour <= 12 && savedTime.contains('AM'.toLowerCase())) {
      isDay = true;
      timeGreet.value = 'GOOD MORNING';
    } else if (hour >= 6 &&
        hour < 12 &&
        savedTime.contains('PM'.toLowerCase())) {
      isDay = false;
      timeGreet.value = 'GOOD EVENING';
    } else if (hour < 6 ||
        hour == 12 && savedTime.contains('PM'.toLowerCase())) {
      isDay = true;
      timeGreet.value = 'GOOD AFTERNOON';
    }
  }
}
