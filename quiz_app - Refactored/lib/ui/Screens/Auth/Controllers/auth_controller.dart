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
import '../../CommonControllers/profile_controllers.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> loginEmailController = TextEditingController().obs;
  Rx<TextEditingController> loginPasswordController =
      TextEditingController().obs;
  List<Users> allusers = [];
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
        print(user.email);
        if (user.email == email.text) {
          print(user.email);
          print("email found lets check the password");

          if (user.password == password.text) {
            controller.userInfo.value = user;
            found = true;
            break;
          } else {
            error.value = "Email address or Password is incorrect";
            isLoading.value = false;
          }
        }
      }
      if (found == true) {
        print(controller.userInfo.value!.password);
        print('You are looking for ${controller.userInfo.value!.id}');
        controller.firstName.value =
            controller.userInfo.value!.firstName.toString().toCapitalized();
        controller.lastName.value =
            controller.userInfo.value!.lastName.toString().toCapitalized();
        controller.password.value =
            controller.userInfo.value!.password.toString();
        controller.gender.value =
            controller.userInfo.value!.gender == 'Male' ? true : false;
      } else {
        error.value = "Email address or Password is incorrect";
        isLoading.value = false;
      }

      if (controller.userInfo.value != null &&
          controller.password.value == pass) {
        if (rememberMe.value) {
          print("remmeber me");
          box1.put('email', emails);
          box1.put('pass', pass);
        } else if (box1.get('email') != null) {
          box1.delete('email');
          print("email deleted");
          print('could be null ${box1.get("email")}');
        }
        print(box1.get('email').toString());
        //print(box1.get('pass').toString());
        controller.scores =
            await fetchUserScores(controller.userInfo.value!.id);
        error.value = "";
        print('Profile DATA  AUTH ${controller.userInfo.value!.email}');
        print('after logout email - auth ${controller.userInfo.value!.email}');
        isLoading.value = false;
        context.router.pushNamed('/category');

        print('after logout email --- ${controller.userInfo.value!.email}');
      }
    } else {
      error.value = "Email address or Password is incorrect";
      isLoading.value = false;
    }
  }

  bool checkDuplicateEmail(String email) {
    var found = false;
    for (var element in allusers) {
      if (element == email) {
        found = true;
        break;
      }
    }
    return found;
  }
}
