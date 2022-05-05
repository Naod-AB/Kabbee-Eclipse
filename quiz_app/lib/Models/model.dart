// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:convert';
import 'package:http/http.dart' as http;

class NameListJson {
  var id;
  var answer;
  bool isCorrect;

  NameListJson({this.id, this.answer, required this.isCorrect});

  factory NameListJson.fromJson(Map<String, dynamic> json) {
    return NameListJson(
      id: json['id'],
      answer: json['answer'],
      isCorrect: json['isCorrect'],
    );
  }
}

Future<NameListJson> updateJsonTime({
  required String answer,
  required int id,
  required bool isCorrect,
}) async {
  final response = await http.patch(
    Uri.parse('http://localhost:3000/answers/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'answer': answer,
      'isCorrect': isCorrect,
    }),
  );
  if (response.statusCode == 200) {
    return NameListJson.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Error);
  }
}

Future<int> fetchCorrectAnswers() async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/answers'),
  );
  var count = 0;

  // print(response.body);
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  for (var item in parsed) {
    if (item['isCorrect'] == true) {
      count++;
    }
  }

  return count;
}

// List<NameListJson> parseAnswers(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  

//   for (var item in parsed['isCorrect']) {
//     print('item $item');
//   }

//   return 1;
//   // parsed
//   //     .map<NameListJson>((json) => NameListJson.fromJson(json))
//   //     .toList();
// }
