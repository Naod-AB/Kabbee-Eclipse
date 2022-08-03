import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

class SignupPassword extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  Users user;
  TextEditingController passController;
  TextEditingController confirmController;
  GlobalKey<FormFieldState> passKey;
  GlobalKey<FormFieldState> confirmKey;
  //  PasswordValidator passwordValidator = new PasswordValidator(
  //    uppercase: 1,
  //    min: 6,
  //    digits: 1
  //  );
  SignupPassword(
      {Key? key,
      required this.user,
      required this.passController,
      required this.passKey,
      required this.confirmController,
      required this.confirmKey})
      : super(key: key);

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool hidP = false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Create account'.tr,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.30),
            ),
            Text(
              'please enter your password'.tr,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: getProportionateScreenWidth(10),
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.50),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
<<<<<<< HEAD
                TextFormField(
                  controller: passController,
                  key: passKey,
                  onSaved: (value) {
                    user.password = value;
                  },
                  validator: (value) {
                    if (!validateStructure(value!)) {
                      return 'Enter a Valid Password'.tr;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter password'.tr,
                    labelStyle: TextStyle(fontSize: 18),
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        icon: Icon(
                          profileController.x.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: profileController.x.value
                              ? orangeColor
                              : Colors.white,
                        ),
                        onPressed: () {
                          profileController.x.value =
                              !profileController.x.value;
                          // setState(() {
                          //   profileController.x.value = !profileController.x.value;
                          //   print(profileController.x.value);
                          // });
                        },
=======
                Obx(
                  () => TextFormField(
                    controller: passController,
                    key: passKey,
                    onSaved: (value) {
                      user.password = value;
                    },
                    validator: (value) {
                      if (!validateStructure(value!)) {
                        return 'Enter a Valid Password';
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Enter password',
                      labelStyle: TextStyle(fontSize: 18),
                      fillColor: Theme.of(context).colorScheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
>>>>>>> d8ac6fe3451a5baeb13e6a8e9d18a2250e08f35b
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: GestureDetector(
                            onTap: () {
                              print(!authController.signUpObsecure.value);
                              authController.signUpObsecure.value =
                                  !authController.signUpObsecure.value;
                              // setState(() {
                              //   _obscureText = !_obscureText;
                              // });
                            },
                            child: Icon(
                                authController.signUpObsecure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kblue)),
                        // child: Icon(
                        //   FontAwesomeIcons.lock,
                        //   size: 28,
                        //   color: kblue,
                        // ),
                      ),
                      // hintText: 'Enter Password',
                      // hintStyle: kBodyText,
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onBackground,
                        height: 1.5),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: authController.signUpObsecure.value,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
<<<<<<< HEAD
                TextFormField(
                  controller: confirmController,
                  key: confirmKey,
                  validator: (value) {
                    if (confirmController.text != passController.text) {
                      return 'The Two password need to be  the same '.tr;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Confirm Password'.tr,
                    labelStyle: TextStyle(fontSize: 18),
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        icon: Icon(
                          profileController.y.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: profileController.y.value
                              ? orangeColor
                              : Colors.white,
                        ),
                        onPressed: () {
                          profileController.y.value =
                              !profileController.y.value;
                          // setState(() {
                          //   profileController.y.value = !profileController.y.value;
                          //   print(profileController.y.value);
                          // });
                        },
=======
                Obx(
                  () => TextFormField(
                    controller: confirmController,
                    key: confirmKey,
                    validator: (value) {
                      if (confirmController.text != passController.text) {
                        return 'The Two password need to be  the same ';
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 18),
                      fillColor: Theme.of(context).colorScheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
>>>>>>> d8ac6fe3451a5baeb13e6a8e9d18a2250e08f35b
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: GestureDetector(
                            onTap: () {
                              print(!authController
                                  .signUpConfirmationObsecure.value);
                              authController.signUpConfirmationObsecure.value =
                                  !authController
                                      .signUpConfirmationObsecure.value;
                              // setState(() {
                              //   _obscureText = !_obscureText;
                              // });
                            },
                            child: Icon(
                                authController.signUpConfirmationObsecure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kblue)),
                        //passwordVisibilityBtn(),
                      ),
                      // hintText: 'Confirm Password',
                      // hintStyle: kBodyText,
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onBackground,
                        height: 1.5),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText:
                        authController.signUpConfirmationObsecure.value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Tooltip(
                        message:
                            "* Password have to have 6 or more in characters \n * At to have at least on UpperCase letter \n * At least one digit \n at least one special character  "
                                .tr,
                        waitDuration: Duration(microseconds: 500),
                        showDuration: Duration(seconds: 1),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(Icons.question_mark)))
                  ],
                )
              ],
            ),
          ]),
    );
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
