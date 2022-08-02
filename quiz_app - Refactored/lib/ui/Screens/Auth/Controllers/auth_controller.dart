// import 'dart:math';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:quiz_app/service/services.dart';
// import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
// import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
// import 'package:quiz_app/ui/utils/string_extension.dart';
// import '../../CommonControllers/profile_controllers.dart';

// class AuthController extends GetxController {
//   Rx<TextEditingController> loginEmailController = TextEditingController().obs;
//   Rx<TextEditingController> loginPasswordController =
//       TextEditingController().obs;
//   List<Users> allusers = [];
//   RxBool obsecure = true.obs;
//   RxBool rememberMe = false.obs;
//   RxBool isLoading = false.obs;
//   RxString error = "".obs;
//   RxInt signUpIndex = 0.obs;
//   late Box box1;

//   @override
//   void onInit() async {
//     super.onInit();
//     createOpenBox();

//     //allusers = await fetchAllUsers();
//   }

//   void createOpenBox() async {
//     box1 = await Hive.openBox('logindata');

//     getdata();
//   }

//   void getdata() async {
//     if (box1.get('email') != null && box1.get('pass') != null) {
//       loginEmailController.value.text = box1.get('email');
//       loginPasswordController.value.text = box1.get('pass');
//     }
//   }

//   Future<void> signUp(Users user, ProfileController controller,
//       GlobalKey<FormState> formKey, BuildContext context) async {
//     if (signUpIndex.value == 0) {
//       if (controller.emailFieldKey.value.currentState!.validate()) {
//         signUpIndex.value++;
//       }
//     } else if (signUpIndex.value == 1) {
//       if (controller.passFieldKey.value.currentState!.validate() &&
//           controller.confirmFieldKey.value.currentState!.validate()) {
//         signUpIndex.value++;
//       }
//     } else if (signUpIndex.value == 2) {
//       if (controller.firstNameFieldKey.value.currentState!.validate() &&
//           controller.lastNameFieldKey.value.currentState!.validate()) {
//         formKey.currentState!.save();
//         user.gender = controller.genderIndex.value ? "Male" : "Female";
//         var id = Random();
//         user.id = id.nextInt(1000);
//         await createUser(user);
//         context.router.pushNamed("/");
//       }
//     }
//   }

//   void authenticateUser(
//       {required BuildContext context,
//       required GlobalKey<FormFieldState> emailKey,
//       required GlobalKey<FormFieldState> passKey,
//       required TextEditingController email,
//       required TextEditingController password}) async {
//     isLoading.value = true;

//     var pass = password.text.trim();
//     var emails = email.text.trim().toLowerCase();
//     List<Users> users = await fetchAllUsers();
//     if (emailKey.currentState!.validate() && passKey.currentState!.validate()) {
//       //controller.userInfo.value = await fetchUser(emails);
//       var found = false;
//       for (var user in users) {
//         if (user.email == email.text) {
//           if (user.password == password.text) {
//             controller.userInfo.value = user;
//             found = true;
//             break;
//           } else {
//             error.value = "Email address or Password is incorrect";
//             isLoading.value = false;
//           }
//         }
//       }
//       if (found == true) {
//         controller.firstName.value =
//             controller.userInfo.value!.firstName.toString().toCapitalized();
//         controller.lastName.value =
//             controller.userInfo.value!.lastName.toString().toCapitalized();
//         controller.password.value =
//             controller.userInfo.value!.password.toString();
//         controller.gender.value =
//             controller.userInfo.value!.gender == 'Male' ? true : false;
//       } else {
//         error.value = "Email address or Password is incorrect";
//         isLoading.value = false;
//       }

//       if (controller.userInfo.value != null &&
//           controller.password.value == pass) {
//         if (rememberMe.value) {
//           box1.put('email', emails);
//           box1.put('pass', pass);
//         } else if (box1.get('email') != null) {
//           box1.delete('email');
//         }
//         controller.scores =
//             await fetchUserScores(controller.userInfo.value!.id);
//         error.value = "";
//         isLoading.value = false;
//         context.router.pushNamed('/category');
//       }
//     } else {
//       error.value = "Email address or Password is incorrect";
//       isLoading.value = false;
//     }
//   }
// }

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
  RxBool loadingUser = false.obs;

  Rx<TextEditingController> loginEmailController = TextEditingController().obs;
  Rx<TextEditingController> loginPasswordController =
      TextEditingController().obs;
  List<Users> allusers = [];
  RxBool obsecure = true.obs;
  RxBool signUpObsecure = true.obs;
  RxBool signUpConfirmationObsecure = true.obs;
  RxBool rememberMe = false.obs;
  RxString error = "".obs;
  RxInt signUpIndex = 0.obs;
  late Box box1;

  @override
  void onInit() async {
    super.onInit();
    createOpenBox();
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
    print(signUpIndex.value);
    if (signUpIndex.value == 0) {
      if (controller.emailFieldKey.value.currentState!.validate()) {
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
    var pass = password.text.trim();
    var emails = email.text.trim().toLowerCase();

    if (emailKey.currentState!.validate() && passKey.currentState!.validate()) {
      loadingUser.value = true;

      try {
        controller.userInfo.value = await fetchUser(emails);
        error.value = "";

        controller.firstName.value =
            controller.userInfo.value!.firstName.toString().toCapitalized();
        controller.lastName.value =
            controller.userInfo.value!.lastName.toString().toCapitalized();
        controller.password.value =
            controller.userInfo.value!.password.toString();
        controller.gender.value =
            controller.userInfo.value!.gender == 'Male' ? true : false;

        if (controller.userInfo.value != null &&
            controller.password.value == pass) {
          if (rememberMe.value) {
            print("remember me");
            box1.put('email', emails);
            box1.put('pass', pass);
          } else if (box1.get('email') != null) {
            box1.delete('email');
            print("email deleted");
            print('could be null ${box1.get("email")}');
          }
          print(box1.get('email').toString());
          print(box1.get('pass').toString());

          controller.scores =
              await fetchUserScores(controller.userInfo.value!.id);
          error.value = error.value;

          // print('after logout email - auth ${controller.userInfo.value!.email}');
          await context.router.pushNamed('/category');
          loadingUser.value = false;
          error.value = "";

          // print('after logout email --- ${controller.userInfo.value!.email}');
        } else {
          print(" Password is incorrect");
          error.value = "Email address or Password is incorrect";
          loadingUser.value = false;
        }
      } catch (e) {
        loadingUser.value = false;
        error.value = "Email address or Password is incorrect";
      }
    }
  }
}
