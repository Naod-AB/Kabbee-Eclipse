import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/routes/router.gr.dart';

import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';

import '../ui/Screens/Auth/Controllers/auth_controller.dart';
import '../ui/Screens/CommonControllers/question_controller.dart';
import '../ui/Screens/Profile/widgets/user_profile_widget.dart';
import '../ui/Screens/Question/models/checkanswer.dart';

// Save User Score
//final ProfileController aProfileController = Get.put(ProfileController());
//final QuestionControl aQuestionrofileController = Get.put(QuestionControl());

Future<CourseScore> saveUserScore(CourseScore score) async {
  final response = await http.patch(
      Uri.parse('https://eclipse-api.herokuapp.com/scores/${score.courseId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': score.courseId,
        'courseName': score.courseName,
        'courseType': score.courseType,
        'courseScore': score.courseScore,
        'percentage': score.coursePercentage,
        'userId': score.userId
      }));

  if (response.statusCode == 204) {
    return CourseScore.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Save score.');
  }
}

// create user score

Future<CourseScore> createUserScore(CourseScore score) async {
  final response =
      await http.post(Uri.parse('https://eclipse-api.herokuapp.com/scores'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id': score.courseId,
            'courseName': score.courseName,
            'courseType': score.courseType,
            'courseScore': score.courseScore,
            'percentage': score.coursePercentage,
            'userId': score.userId
          }));
  if (response.statusCode == 201) {
    return CourseScore.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create score.');
  }
}

// Create User
Future<Users> createUser(Users user) async {
  final response = await http.post(
    Uri.parse('https://eclipse-api.herokuapp.com/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': user.id!,
      'email': user.email!,
      'firstName': user.firstName!,
      'lastName': user.lastName!,
      'password': user.password!,
      'gender': user.gender!,
      'status': 'ACTIVE',
      'role': 'USER',
    }),
  );
  if (response.statusCode == 201) {
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create User.');
  }
}

// Fetch MY Scores
Future fetchUserScores(int userId) async {
  final response = await http.get(Uri.parse(
      'https://eclipse-api.herokuapp.com/scores/filter/?userId=$userId'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsed = jsonDecode(response.body);

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
  final response = await http.get(Uri.parse(
      'https://eclipse-api.herokuapp.com/users/search/findByEmail?email=$email'));

  if (jsonDecode(response.body)["_embedded"]["users"].length != 0) {
    return Users.fromJson(jsonDecode(response.body)["_embedded"]["users"][0]);
  } else {
    throw Exception('Failed to load user');
  }
}

// Fetch all users
Future<List<Users>> fetchAllUsers() async {
  final response =
      await http.get(Uri.parse('https://eclipse-api.herokuapp.com/users'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    return parseUsers(response.body);
  } else {
    throw Exception('Failed to fetch Users');
  }
}

// Parse Users
List<Users> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody)["_embedded"]["users"];

  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}
//get Dashboard

Future<List> fetchDashboard() async {
  final response =
      await http.get(Uri.parse('https://eclipse-api.herokuapp.com/courses'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    final dashboardData = (jsonDecode(response.body)["_embedded"]["courses"]);

    return dashboardData;
  } else {
    throw Exception('Failed to fetch Courses');
  }
}

Future<List> fetchquestionLength() async {
  final response =
      await http.get(Uri.parse('https://eclipse-api.herokuapp.com/questions'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    final dashboardData = (jsonDecode(response.body)["_embedded"]["questions"]);
    log('Questions response is ${response.body}');
    return dashboardData;
  } else {
    throw Exception('Failed to fetch Questions');
  }
}

// fetching users for adminList

Future<List> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://eclipse-api.herokuapp.com/users'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsed = jsonDecode(response.body)["_embedded"]["users"];

      return parsed;
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load User Lists');
  }
}

Future<Users> updateUsersList({
  required String id,
  required int index,
  required bool status,
}) async {
  final response = await http.patch(
    Uri.parse('https://eclipse-api.herokuapp.com/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'password': controller.updatedPassword.value,
      'status': status ? 'BLOCKED' : 'ACTIVE',
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 204) {
    if (status == true) {
      controller.blockedUsers.add(controller.activeUsers[index]);
      controller.activeUsers.removeAt(index);
    } else {
      controller.activeUsers.add(controller.blockedUsers[index]);
      controller.blockedUsers.removeAt(index);
    }

    controller.activeUsersCount.value = controller.activeUsers.length;
    controller.blockedUsersCount.value = controller.blockedUsers.length;

    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Error);
  }
}

// Get Questions
Future fetchQuestionsApi(String path, String type) async {
  final response = await http.get(Uri.parse(
      'https://eclipse-api.herokuapp.com/questions/filter/?type=$type&topic=$path'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsedPath = jsonDecode(response.body);

      return parsedPath;
    } else {
      return null;
    }
  } else {
    throw Exception('Failed to load Path');
  }
}

// fetch categories
Future fetchCourses(String category) async {
  final response = await http.get(Uri.parse(
      'https://eclipse-api.herokuapp.com/courses/filter/?category=$category'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    final parsedCourses = jsonDecode(response.body);

    return parsedCourses;
  } else {
    throw Exception('Failed to fetch Courses');
  }
}

//  from model.dart //

class ChosenModel {
  final int questionNumber;
  final String questionAnswer;

  ChosenModel(this.questionNumber, this.questionAnswer);

  @override
  String toString() {
    return '$questionNumber $questionAnswer';
  }
}

// Add Choices
Future<CheckAnswer> updateJsonTime({
  required String answer,
  required int id,
  required bool isCorrect,
  required bool isSelected,
}) async {
  final response = await http.patch(
    Uri.parse('https://eclipse-api.herokuapp.com/answers/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'answer': answer,
      'isCorrect': isCorrect,
      'isSelected': isSelected,
    }),
  );

  log('log is ${response.statusCode}');
  if (response.statusCode == 200) {
    return CheckAnswer.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Error);
  }
}

// For Score page
Future<int> fetchCorrectAnswers() async {
  final response = await http.get(
    Uri.parse('https://eclipse-api.herokuapp.com/answers'),
  );
  var count = 0;

  final parsed = jsonDecode(response.body)["_embedded"]["answers"];
  for (var item in parsed) {
    if (item['isCorrect'] == true) {
      count++;
    }
  }

  return count;
}

// To update profile to Api
Future<Users> updateJprofile({
  required String id,
}) async {
  final response = await http.patch(
    Uri.parse('https://eclipse-api.herokuapp.com/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'firstName': controller.firstName.value,
      'lastName': controller.lastName.value,
      'password': controller.password.value,
      'gender': controller.gender.value ? 'Male' : 'Female',
    }),
  );
  if (response.statusCode == 200) {
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(Error);
  }
}

logOut(BuildContext context) async {
  await Get.delete<AuthController>();
  Get.delete<ProfileController>();
  Get.delete<QuestionController>();

  print(controller.userInfo.value!.email);
  // Get.put(AuthController());
  Get.put(AuthController());
// get.testmode=true
//

  // Get.offAllNamed('/login');
  Get.offAll(const LoginRoute());
}
