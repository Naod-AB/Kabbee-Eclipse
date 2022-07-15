import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/service/services.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/common_widgets/rounded_button_mine.dart';
import 'package:quiz_app/ui/utils/size_config.dart';
import 'package:quiz_app/ui/utils/theme.dart';

//import '../../widgets/widgets.dart';

import '../Login/login_screen.dart';
import 'signUp_password.dart';
import 'signup_email.dart';
import 'signup_name.dart';

class OneSignupPage extends StatelessWidget {
  ProfileController profilecontroller = Get.find();
  AuthController authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  OneSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Users user = Users();
    EmailValidator emailValidator = EmailValidator();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        leading: const BackButton(),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: Container(
            height: SizeConfig.screenHeight * 0.85,
            child: Column(
              children: [
                Theme(
                  data: ThemeData(canvasColor: bgColor),
                  child: Expanded(
                    child: Obx(() => Stepper(
                            controlsBuilder:
                                (context, ControlsDetails details) {
                              return Row(
                                children: <Widget>[
                                  Container(),
                                  Container(),
                                ],
                              );
                            },
                            type: StepperType.horizontal,
                            currentStep: authController.signUpIndex.value,
                            steps: [
                              Step(
                                  state: authController.signUpIndex.value == 0
                                      ? StepState.editing
                                      : StepState.complete,
                                  isActive:
                                      authController.signUpIndex.value >= 0,
                                  title: Text(
                                    "Email",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Center(
                                      child: SignupEmail(
                                    user: user,
                                    controller: profilecontroller
                                        .emailController
                                        .value, //_emailController ,
                                    emailKey: profilecontroller
                                        .emailFieldKey.value, //emailFieldkey,
                                    validator: emailValidator,
                                    allUsers: authController.allusers,
                                  ))),
                              Step(
                                  state: authController.signUpIndex.value <= 1
                                      ? StepState.editing
                                      : StepState.complete,
                                  isActive:
                                      authController.signUpIndex.value >= 1,
                                  title: Text("Password",
                                      style: TextStyle(color: Colors.white)),
                                  content: Center(
                                      child: SignupPassword(
                                          user: user,
                                          passController: profilecontroller
                                              .passwordController
                                              .value, //_passwordController,
                                          passKey: profilecontroller
                                              .passFieldKey
                                              .value, //passFieldKey,
                                          confirmController: profilecontroller
                                              .confirmController
                                              .value, // _confimController,
                                          confirmKey: profilecontroller
                                              .confirmFieldKey
                                              .value //confirmFieldKey,
                                          ))),
                              Step(
                                  state: authController.signUpIndex.value <= 1
                                      ? StepState.editing
                                      : StepState.complete,
                                  isActive:
                                      authController.signUpIndex.value >= 2,
                                  title: const Text("Full Name",
                                      style: TextStyle(color: Colors.white)),
                                  content: //Container()
                                      SignupName(
                                    firstNameController: profilecontroller
                                        .firstNameController
                                        .value, //_firstNameController,
                                    firtNameKey: profilecontroller
                                        .firstNameFieldKey
                                        .value, //firstNameFieldKey,
                                    lastNameController: profilecontroller
                                        .lastNameController
                                        .value, //_lastNameController,
                                    lastNameKey: profilecontroller
                                        .lastNameFieldKey
                                        .value, //lastNameFieldKey,
                                    user: user,
                                  )),
                            ])),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.09),
                  child: Row(
                    children: [
                      if (authController.signUpIndex.value != 0)
                        Expanded(
                          child: RoundedButton(
                              buttonName: "Back",
                              pressed: () {
                                authController.signUpIndex.value--;
                              }),
                        ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.01,
                      ),
                      Expanded(
                        child: RoundedButton(
                            buttonName: "Next",
                            pressed: () => authController.signUp(
                                user, profilecontroller, formKey, context)),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
