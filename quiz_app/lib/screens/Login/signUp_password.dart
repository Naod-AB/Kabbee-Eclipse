import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/profile_controllers.dart';

import '../../Models/users.dart';
import '../../Utilities/size_config.dart';
import '../../widgets/pallete.dart';
import '../../widgets/user_profile_widget.dart';

class SignupPassword extends StatefulWidget {
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

  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

class _SignupPasswordState extends State<SignupPassword> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    bool hidP = false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Create account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.30),
            ),
            Text(
              'please enter your password',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(10),
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.50),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: widget.passController,
                  key: widget.passKey,
                  onSaved: (value) {
                    widget.user.password = value;
                  },
                  validator: (value) {
                    if (!validateStructure(value!)) {
                      return 'Enter a Valid Password';
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[500]!.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        icon: Icon(
                          controller.x.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              controller.x.value ? orangeColor : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.x.value = !controller.x.value;
                            print(controller.x.value);
                          });
                        },
                      ),
                      //passwordVisibilityBtn(),
                      //  Icon(
                      //   FontAwesomeIcons.solidEnvelope,
                      //   size: 28,
                      //   color: kblue,
                      // ),
                    ),
                    hintText: 'Enter Password',
                    hintStyle: kBodyText,
                  ),
                  style: kBodyText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obscureText: controller.x.value,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: widget.confirmController,
                  key: widget.confirmKey,
                  validator: (value) {
                    if (widget.confirmController.text !=
                        widget.passController.text) {
                      return 'The Two password need to be  the same ';
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[500]!.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        icon: Icon(
                          controller.y.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              controller.y.value ? orangeColor : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.y.value = !controller.y.value;
                            print(controller.y.value);
                          });
                        },
                      ),
                      //passwordVisibilityBtn(),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: kBodyText,
                  ),
                  style: kBodyText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obscureText: controller.y.value,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Tooltip(
                        message:
                            "* Password have to have 6 or more in characters \n * At to have at least on UpperCase letter \n * At least one digit \n at least one special character  ",
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
