//main.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'model.dart';

String subheadertxt = "PLEASE SELECT ONE OF THE FOLLOWING OPTION";
String subheadername = "PLEASE SELECT YOUR NAME";
String subheaderoption = "PLEASE SELECT ONE OPTION";
String subheadernone = "";
double width50 = 50;
double width40 = 40;
double widthfactorlong = 0.7;
double widthfactorshort = 0.33;
bool? isDay;

Future<NameListJson> updateJsonTime(
    {String? time, int? id, bool? checkStatus}) async {
  final response = await http.patch(
    Uri.parse('http://localhost:3000/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'checkedInTime': time,
      'checkStatus': checkStatus,
    }),
  );
  if (response.statusCode == 200) {
    return NameListJson.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Error);
  }
}

class TimeController extends GetxController {
  Future<List<NameListJson>> fetchNameList() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/users'),
    );

    return parseNameLists(response.body);
  }

  List<NameListJson> parseNameLists(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<NameListJson>((json) => NameListJson.fromJson(json))
        .toList();
  }

  var time = ''.obs;
  var timeGreet = ''.obs;
  var savedtime = ''.obs;

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
