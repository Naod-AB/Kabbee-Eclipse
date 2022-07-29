import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';
import 'package:email_validator/email_validator.dart';

// ;
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/service/services.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/common_widgets/rounded_button_mine.dart' as button;
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

import '../Controllers/lang_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());
  var isLoading = true;
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();

  GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

  //String? valueChoose;
  dynamic dropdownValue = "Menu one";

  String? SelectedValue;

  @override
  MyController myController = Get.put(MyController());

  Widget build(BuildContext context) {
    print('Value');
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
                child: Text('LOGIN',
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
                              labelText: 'Enter email',
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
                              // hintText: 'Enter email',
                              // hintStyle: TextStyle(
                              //     fontSize: 16,
                              //     color:
                              //         Theme.of(context).colorScheme.onSecondary,
                              //     height: 1.5),
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
                            labelText: 'Enter password',
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
                                    color: authController.obsecure.value
                                        ? Color.fromARGB(255, 255, 165, 0)
                                        : Color.fromARGB(255, 255, 165, 0),
                                  )),
                              // child: Icon(
                              //   FontAwesomeIcons.lock,
                              //   size: 28,
                              //   color: kblue,
                              // ),
                            ),
                            // hintText: 'Enter Password',
                            // hintStyle: TextStyle(
                            //     fontSize: 16,
                            //     color:
                            //         Theme.of(context).colorScheme.onSecondary,
                            //     height: 1.5),
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
                            'Remember me',
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
                      Obx(() => button.RoundedButton(
                          buttonName: authController.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: kBodyText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                          pressed: () => authController.authenticateUser(
                              context: context,
                              email: authController.loginEmailController.value,
                              emailKey: emailKey,
                              passKey: passKey,
                              password: authController
                                  .loginPasswordController.value))),
                      SizedBox(height: 15), //SizeConfig.screenHeight * 0.03
                      SizedBox(
                        width: 50, //SizeConfig.screenWidth * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don`t have an account ?',
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
                              'Sign up',
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

                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "select language".tr,
                        style: TextStyle(
                          fontSize: 16,
                          //fontFamily:
                          //fontFamily: Roboto,
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                                  'select language'.tr,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                              color: kblue,
                            ),
                            dropdownColor: Color.fromARGB(255, 39, 37, 37),
                            value: '${myController.langValue.value}',
                            items: Language.languageList()
                                .map((lang) => DropdownMenuItem(
                                    value: lang.name,
                                    child: Row(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          lang.flag,
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text(
                                          lang.name,
                                          style: TextStyle(color: Colors.white),
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
                                if (value == 'ትግሪኛ') {
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

                      // Obx(
                      //   () => DropdownButton(
                      //       value: '${myController.langValue.value}',
                      //       style: TextStyle(color: Colors.amber),
                      //       // items: [
                      //       //   for (var item in items)
                      //       //     DropdownMenuItem<String>(
                      //       //         value: item, child: Text(item))
                      //       // ],
                      //       items: items.map((e) {
                      //         return DropdownMenuItem(
                      //             value: e,
                      //             child: Row(
                      //               children: [Text(e.flag), Text(e.name)],
                      //             ));
                      //       }).toList(),
                      //       // Language.languageList()
                      //       // .map((e) =>
                      //       // DropdownMenuItem(
                      //       //   child: Row)).toList()

                      //       onChanged: (value) {
                      //         if (value != null) {
                      //           myController.langValue.value = value.toString();
                      //         }
                      //         print(value);
                      //         if (value == 'Tigrina') {
                      //           myController.changeLanguage('tig', 'ER');
                      //         }
                      //         // myController.changeLanguage('en', 'US');
                      //         else {
                      //           myController.changeLanguage('en', 'US');
                      //         }
                      //       }),
                      // ),
                      // Obx(
                      //   (() => DropdownButton<String>(
                      //       value: '${myController.langValue.value}',
                      //       style: TextStyle(color: Colors.amber),
                      //       // items: [
                      //       //   for (var item in items)
                      //       //     DropdownMenuItem<String>(
                      //       //         value: item, child: Text(item))
                      //       // ],
                      //       items: items
                      //           .map<DropdownMenuItem<String>>(
                      //               (e) => DropdownMenuItem(
                      //                   value: myController.langValue.value,
                      //                   child: Row(
                      //                     children: [
                      //                       Text(e.flag),
                      //                       Text(e.name)
                      //                     ],
                      //                   )))
                      //           .toList(),
                      //       // Language.languageList()
                      //       // .map((e) =>
                      //       // DropdownMenuItem(
                      //       //   child: Row)).toList()

                      //       onChanged: (value) {
                      //         if (value != null) {
                      //           myController.langValue.value = value.toString();
                      //         }
                      //         print(value);
                      //         if (value == 'Tigrina') {
                      //           myController.changeLanguage('tig', 'ER');
                      //         }
                      //         // myController.changeLanguage('en', 'US');
                      //         else {
                      //           myController.changeLanguage('en', 'US');
                      //         }
                      //         // setState(() {
                      //         //   value;
                      //         // });
                      //       })),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       //  myController.changeLanguage('tig', 'ER');
                      //       myController.changeLanguage('er', 'US');
                      //     },
                      //     child: Text('English')),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       //  myController.changeLanguage('tig', 'ER');
                      //       myController.changeLanguage('tig', 'ER');
                      //     },
                      //     child: Text('Tigrina'))
                    ]),
              ),

              SizedBox(
                height: 15, //SizeConfig.screenHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DropDown extends StatefulWidget {
//   DropDown({Key? key, required this.items}) : super(key: key);
//   List items;
//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {
//   @override
//   MyController myController = Get.put(MyController());
//   Widget build(BuildContext context) {
//     return DropdownButton(
//         //  value: '${myController.langValue.value}',
//         style: TextStyle(color: Colors.amber),
//         // items: [
//         //   for (var item in items)
//         //     DropdownMenuItem<String>(
//         //         value: item, child: Text(item))
//         // ],
//         items: widget.items.map((e) {
//           return DropdownMenuItem(
//               value: e,
//               child: Row(
//                 children: [Text(e.flag), Text(e.name)],
//               ));
//         }).toList(),
//         // Language.languageList()
//         // .map((e) =>
//         // DropdownMenuItem(
//         //   child: Row)).toList()

//         onChanged: (value) {
//           if (value != null) {
//             myController.langValue.value = ;
//           }
//           print(value);
//           if (value == 'Tigrina') {
//             myController.changeLanguage('tig', 'ER');
//           }
//           // myController.changeLanguage('en', 'US');
//           else {
//             myController.changeLanguage('en', 'US');
//           }
//           setState(() {
//             value;
//           });
//         });
//   }
// }
