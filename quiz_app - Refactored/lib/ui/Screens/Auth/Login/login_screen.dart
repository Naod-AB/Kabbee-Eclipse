import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';
import 'package:email_validator/email_validator.dart';

import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

import '../../../common_widgets/rounded_button_mine.dart';
import '../Controllers/lang_controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

AuthController authController = Get.put(AuthController());

class _LoginPageState extends State<LoginPage> {
  var isLoading = true;
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();

  GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();
  //bool hasInternet = false;
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  //String? valueChoose;
  dynamic dropdownValue = "Menu one";

  @override
  void initState() {
    getConnectivity();

    super.initState();
    setState(() {
      print('starting login');
    });
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      });
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  String? SelectedValue;

  MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    String selam = 'selam@gmail.com';
    //authController.getdata(context);
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20), //SizeConfig.screenWidth * 0.05
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60 //SizeConfig.screenHeight * 0.04,
                  ),
              Center(
                child: Text('LOGIN'.tr,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.onBackground)),
              ),
              // ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 25), //SizeConfig.screenWidth * 0.05
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => TextFormField(
                            key: emailKey,
                            controller:
                                authController.loginEmailController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email cannot be empty ";
                              } else {
                                if (!EmailValidator.validate(value)) {
                                  // print(value);
                                  return "Enter a valid email";
                                }
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'Enter email'.tr,
                              labelStyle: TextStyle(fontSize: 16),
                              // focusColor: Colors.orange,
                              fillColor: Theme.of(context).colorScheme.tertiary,
                              // fillColor: Colors.grey[500]!.withOpacity(0.5),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.solidEnvelope,
                                  size: 28,
                                  color: kblue,
                                ),
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                height: 1.5),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                          )),
                      SizedBox(height: 25 //SizeConfig.screenHeight * 0.02,
                          ),
                      Obx(
                        () => TextFormField(
                          key: passKey,
                          controller:
                              authController.loginPasswordController.value,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Password canot be empty".tr;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Enter password'.tr,
                            labelStyle: TextStyle(fontSize: 16),
                            focusColor: Colors.orange,
                            fillColor: Theme.of(context).colorScheme.tertiary,
                            // fillColor: Colors.grey[500]!.withOpacity(0.5),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: GestureDetector(
                                  onTap: () {
                                    print(!authController.obsecure.value);
                                    authController.obsecure.value =
                                        !authController.obsecure.value;
                                    // setState(() {
                                    //   _obscureText = !_obscureText;
                                    // });
                                  },
                                  child: Icon(
                                      authController.obsecure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: kblue)),
                            ),
                          ),
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onSecondary,
                              height: 1.5),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          obscureText: authController.obsecure.value,
                        ),
                      ),

                      Obx(
                        () => Text(
                          authController.error.value,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Obx(
                        () => CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          // tileColor: Colors.blue,
                          title: Text(
                            'Remember me'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          value: authController.rememberMe.value,
                          onChanged: (value) {
                            authController.rememberMe.value = value!;
                            // setState(() {
                            //   rememberMe = value!;
                            // });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: kblue,
                          checkColor: kblack,
                          side: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary, //your desire colour here
                            width: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 20 //SizeConfig.screenHeight * 0.03, //25,
                          ),
                      Obx(
                        () => authController.loadingUser.value
                            ? LoadingRoundedButton()
                            : RoundedButton(
                                buttonName: Text(
                                  'LOGIN'.tr,
                                  style: kBodyText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                pressed: () {
                                  if (!isDeviceConnected &&
                                      isAlertSet == false) {
                                    showDialogBox();
                                    setState(() => isAlertSet = true);
                                  }
                                  print('logging user..');
                                  authController.loadingUser.value = true;
                                  authController.authenticateUser(
                                      context: context,
                                      email: authController
                                          .loginEmailController.value,
                                      emailKey: emailKey,
                                      passKey: passKey,
                                      password: authController
                                          .loginPasswordController.value);
                                }),
                      ),

                      const SizedBox(
                          height: 15), //SizeConfig.screenHeight * 0.03
                      const SizedBox(
                        width: 50, //SizeConfig.screenWidth * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don`t have an account ?'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16,
                                height: 1.5,
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(() => const SignupEmail());
                              context.router.pushNamed('/signup');
                            },
                            child: Text(
                              'Sign up'.tr,
                              style: TextStyle(
                                  color: kblue,
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          //DropdownButton(items: [], onChanged: () ,)
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.language,
                            color: kblue,
                          ),
                          SizedBox(
                            width: 15,
                            height: 50,
                          ),
                          Text("Select language".tr,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16,
                                height: 1.5,
                              )),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: kblue, width: 1.5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.language,
                                  color: kblue,
                                ),
                                // SizedBox(
                                //   width: 25,
                                // ),
                                Text(
                                  'Select language'.tr, //style: TextStyle(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                )
                              ],
                            ),
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                              color: kblue,
                            ),
                            dropdownColor:
                                Theme.of(context).colorScheme.tertiary,
                            value: myController.langValue.value,
                            items: Language.languageList()
                                .map((lang) => DropdownMenuItem(
                                    value: lang.name,
                                    child: Row(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          lang.flag,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          lang.name,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                            fontSize: 16,
                                            height: 1.5,
                                          ),
                                        )
                                      ],
                                    )))
                                .toList(),
                            onChanged: (value) {
                              print(value.toString());
                              setState(() {
                                if (value != null) {
                                  myController.langValue.value =
                                      value.toString();
                                }
                                //print(value);
                                if (value == 'ትግርኛ') {
                                  print('value is before $value');
                                  myController.changeLanguage('tig', 'ER');
                                  //print('value is after $value');
                                }
                                //myController.changeLanguage('en', 'US')
                                else {
                                  myController.changeLanguage('en', 'US');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('No internet'.tr),
            content: Text('Please check your internet connectivity'.tr),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context, 'CANCEL');
                    setState(() => isAlertSet = false);
                    isDeviceConnected =
                        await InternetConnectionChecker().hasConnection;
                  },
                  child: Text('CANCEL'.tr, style: TextStyle(color: kblue)))
            ],
          ));
}
