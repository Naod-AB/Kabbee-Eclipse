import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:quiz_app/service/services.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/string_extension.dart';

// import '../../Category/category_screen.dart';
import '../../../../service/notificationService.dart';
import '../../CommonControllers/profile_controllers.dart';
import '../../Question/models/scores.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> loginEmailController = TextEditingController().obs;
  Rx<TextEditingController> loginPasswordController =
      TextEditingController().obs;
  List<Users> allusers = [];
  int waitInSeconds = 0;
  RxBool obsecure = true.obs;
  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  RxString error = "".obs;
  RxString error2 = "".obs;
  RxInt signUpIndex = 0.obs;
  late Box box1;

  @override
  void onInit() async {
    super.onInit();
    createOpenBox();

    allusers = await fetchAllUsers();
  }

  void createOpenBox() async {
    print("Box not initialized ");
    box1 = await Hive.openBox('logindata');
    print("Box is initialized ");
    print(box1.get('email'));
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null && box1.get('pass') != null) {
      loginEmailController.value.text = box1.get('email');
      print("no null");
      loginPasswordController.value.text = box1.get('pass');
    }
  }

  Future<void> signUp(Users user, ProfileController controller,
      GlobalKey<FormState> formKey, BuildContext context) async {
    if (signUpIndex.value == 0) {
      if (controller.emailFieldKey.value.currentState!.validate()) {
        // if (checkDuplicateEmail(controller.emailController.value.text)) {
        //   error2.value = "Email already registered";
        // } else
        signUpIndex.value++;
        print(signUpIndex.value);
      }
    } else if (signUpIndex.value == 1) {
      if (controller.passFieldKey.value.currentState!.validate() &&
          controller.confirmFieldKey.value.currentState!.validate()) {
        signUpIndex.value++;
      }
    } else if (signUpIndex.value == 2) {
      print(signUpIndex.value);
      if (controller.firstNameFieldKey.value.currentState!.validate() &&
          controller.lastNameFieldKey.value.currentState!.validate()) {
        formKey.currentState!.save();
        user.gender = controller.genderIndex.value ? "Male" : "Female";
        var id = Random();
        user.id = id.nextInt(1000);
        await createUser(user);
        context.router.pushNamed("/");
      }
    }
  }

  void authenticateUser(
      {required BuildContext context,
      required GlobalKey<FormFieldState> emailKey,
      required GlobalKey<FormFieldState> passKey,
      required TextEditingController email,
      required TextEditingController password}) async {
    isLoading.value = true;
    print(isLoading.value);
    var pass = password.text.trim();
    var emails = email.text.trim().toLowerCase();
    List<Users> users = await fetchAllUsers();
    if (emailKey.currentState!.validate() && passKey.currentState!.validate()) {
      print("email and pasword validated ");
      //controller.userInfo.value = await fetchUser(emails);
      var found = false;
      for (var user in users) {
        if (user.email == email.text) {
          print("Miki name");
          if (user.password == password.text) {
            print("Miki" + user.email!);
            pController.userInfo.value = user;
            found = true;
            break;
          } else {
            error.value = "Email address or Password is incorrect";
            isLoading.value = false;
          }
        }
      }
      if (found == true) {
        // print(controller.userInfo.value!.password);
        // print('You are looking for ${controller.userInfo.value!.id}');
        pController.firstName.value =
            pController.userInfo.value!.firstName.toString().toCapitalized();
        pController.lastName.value =
            pController.userInfo.value!.lastName.toString().toCapitalized();
        pController.password.value =
            pController.userInfo.value!.password.toString();
        pController.gender.value =
            pController.userInfo.value!.gender == 'Male' ? true : false;
      } else {
        error.value = "Email address or Password is incorrect";
        isLoading.value = false;
      }

      if (pController.userInfo.value != null &&
          pController.password.value == pass) {
        print("Mohammed" + pController.userInfo.value!.email!);
        if (rememberMe.value) {
          print("remmeber me");
          box1.put('email', emails);
          box1.put('pass', pass);
        } else if (box1.get('email') != null) {
          box1.delete('email');
          print("email deleted");
          print('could be null ${box1.get("email")}');
        }
        // NotificationService().showNotification(
        //     "Unlocked",
        //     " has been unblocked, you can take the exam now ",
        //     "course.courseName!");
        print(box1.get('email').toString());
        //print(box1.get('pass').toString());
        pController.scores =
            (await fetchUserScores(pController.userInfo.value!.id))!;
        for (var courseScore in pController.scores) {
          print("this is the Id up ${courseScore.courseId}");
          checkIfCourseLocked(courseScore);
        }
        // print("this is the first course" + pController.scores[0].courseName!);
        error.value = "";
        print('Profile DATA  AUTH ${pController.userInfo.value!.email}');
        print('after logout email - auth ${pController.userInfo.value!.email}');
        isLoading.value = false;
        context.router.pushNamed('/category');

        print('after logout email --- ${pController.userInfo.value!.email}');
      }
    } else {
      error.value = "Email address or Password is incorrect";
      isLoading.value = false;
    }
  }

  Future<void> checkIfCourseLocked(CourseScore course) async {
    if (course.blocked == true) {
      DateTime takenDate = DateTime.parse(course.takenDate!);
      var newDate = takenDate.add(const Duration(minutes: 5));
      DateTime now = DateTime.now();
      if (now.compareTo(newDate) > 0) {
        print(course.courseName);
        NotificationService().showNotification(
            "Unlocked",
            "${course.courseName} has been unblocked before, you can take the exam now ",
            course.courseName!);
        course.blocked = false;
        course.counter = 0;
        updateExamcounter(course);
      } else {
        waitInSeconds = newDate.difference(now).inSeconds;
        await Future.delayed(Duration(seconds: waitInSeconds)).then((value) {
          NotificationService().showNotification(
              "Unlocked",
              "${course.courseName} has been unblocked, you can take the exam now ",
              course.courseName!);
          course.blocked = false;
          course.counter = 0;
          updateExamcounter(course);
        });
        waitInSeconds = 0;
      }
    }
  }
  // bool checkDuplicateEmail(String email) {
  //   var found = false;
  //   for (var element in allusers) {
  //     if (element == email) {
  //       found = true;
  //       break;
  //     }
  //   }
  //   return found;
  // }
}
