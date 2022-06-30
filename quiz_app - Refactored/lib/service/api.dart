import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';

import '../ui/Screens/Profile/widgets/user_profile_widget.dart';

// Save User Score
final ProfileController pController = Get.find();

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
        'percentage': score.coursePercentage,
        'userId': score.userId
      }));
  if (response.statusCode == 200) {
    log('${score.userId}');
    log('user id${pController.userInfo.value!.id}');
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
      'gender': user.gender!,
      'status': 'active',
      'role': 'user',
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
  final response =
      await http.get(Uri.parse('http://localhost:3000/Scores?userId=$userId'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

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

// fetching users for adminList

Future<List> fetchUsers() async {
  final response = await http.get(Uri.parse('http://localhost:3000/Users'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

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
    Uri.parse('http://localhost:3000/Users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'password': controller.updatedPassword.value,
      'status': status ? 'blocked' : 'active',
    }),
  );
  if (response.statusCode == 200) {
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
Future fetchQuestionsApi(String path) async {
  final response = await http.get(Uri.parse('http://localhost:3000/$path'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    if (!jsonDecode(response.body).isEmpty) {
      final parsedPath = jsonDecode(response.body).cast<Map<String, dynamic>>();

      return parsedPath;
    } else {
      return null;
    }
  } else {
    throw Exception('Failed to load Path');
  }
}

//new api method

// var headersList = {
//   'Accept': '*/*',
//   'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
// };
// Future fetchQuestionsApi(String path) async {
//   //var url = Uri.parse('https://shalombr.pythonanywhere.com/api/practice/');
//   var response = Uri.parse('https://shalombr.pythonanywhere.com/api/practice/');
//   var req = http.Request('get', response);
//   req.headers.addAll(headersList);

//   // var req;
//   var res = await req.send();
//   final resBody = await res.stream.bytesToString();

//   if (res.statusCode >= 200 && res.statusCode < 300) {
//     print(resBody);
//   } else {
//     print(res.reasonPhrase);
//   }
// }

// fetch categories
Future fetchCourses(String category) async {
  final response = await http
      .get(Uri.parse('http://localhost:3000/Courses/?category=$category'));
  if (response.statusCode == 200 || response.statusCode == 304) {
    final parsedCourses = jsonDecode(response.body);

    return parsedCourses;
  } else {
    throw Exception('Failed to fetch Courses');
  }
}
