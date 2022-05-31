import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/Models/scores.dart';
import 'package:quiz_app/Models/users.dart';

// Save User Score

Future<CourseScore> saveUserScore(CourseScore score) async {
  final response = await http.patch(
      Uri.parse('http://localhost:3000/Scores/${score.courseName}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': score.courseName,
        'courseName': score.courseName,
        'courseType': score.courseType,
        'courseScore': score.courseScore,
        'userId': score.userId
      }));
  if (response.statusCode == 200) {
    print("this is inside the scoreSave api function ");
    return CourseScore.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Save score.');
  }
}

// Create User
Future<Users> createUser(Users user) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/Users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': user.id!,
      'email': user.email!,
      'firstName': user.firstName!,
      'lastName': user.lastName!,
      'password': user.password!,
      'gender': user.gender!
    }),
  );
  if (response.statusCode == 201) {
    return Users.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Failed to create User.');
  }
}

// Fetch MY Scores
Future fetchUserScores(int userId) async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/Scores?userId=$userId'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      print('😠 $parsed');
      return parsed;
    } else {
      return null;
    }
  } else {
    throw Exception('Failed to load User scores');
  }
}

// Fetch User
Future<Users?> fetchUser(String email) async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/Users?email=$email'));

  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      return Users.fromJson(jsonDecode(response.body)[0]);
    } else {
      return null;
    }
  } else {
    throw Exception('Failed to load User');
  }
}

// Fetch all users
Future<List<Users>> fetchAllUsers() async {
  final response = await http.get(Uri.parse('http://localhost:3000/Users'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    return parseUsers(response.body);
  } else {
    throw Exception('Failed to fetch Users');
  }
}

// Parse Users
List<Users> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}

// Get Questions
Future fetchQuestionsApi(String path) async {
  final response = await http.get(Uri.parse('http://localhost:3000/$path'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsedPath = jsonDecode(response.body).cast<Map<String, dynamic>>();

      print('😠 $parsedPath');
      print('response.body is ${response.body}');
      return parsedPath;
    } else {
      return null;
    }
  } else {
    throw Exception('Failed to load Path');
  }
}
