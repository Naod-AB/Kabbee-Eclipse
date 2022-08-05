import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/service/services.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/common_widgets/rounded_button_mine.dart';
import 'package:quiz_app/ui/utils/size_config.dart';
import 'package:quiz_app/ui/utils/theme.dart';

//import '../../widgets/widgets.dart';

import '../../../common_widgets/appbar.dart';
import '../../../utils/pallete.dart';
import '../Login/login_screen.dart';
import 'signUp_password.dart';
import 'signup_email.dart';
import 'signup_name.dart';

class OneSignupPage extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  ProfileController profilecontroller = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();

  OneSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Users user = Users();
    EmailValidator emailValidator = EmailValidator();
    print('info if not null ${profilecontroller.userInfo.value!.firstName}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: formKey,
        child: Container(
            height: SizeConfig.screenHeight * 0.85,
            child: Column(
              children: [
                Theme(
                  data: ThemeData(
                    canvasColor: Theme.of(context).scaffoldBackgroundColor,
                    colorScheme: Theme.of(context).colorScheme.copyWith(),
                  ),
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
                                    "Email".tr,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
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
                                  title: Text(
                                    "Password".tr,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  ),
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
                                  title: Text(
                                    "Full Name".tr,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  ),
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
                      Obx(
                        () => authController.signUpIndex.value != 0
                            ? Expanded(
                                child: RoundedButton(
                                    buttonName: Text(
                                      "Back",
                                      style: kBodyText.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    pressed: () {
                                      authController.signUpIndex.value--;
                                    }),
                              )
                            : Container(),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.05,
                      ),
                      Expanded(
                        child: RoundedButton(
                            buttonName: Text(
                              "Next",
                              style: kBodyText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
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
