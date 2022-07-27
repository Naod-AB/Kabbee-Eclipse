// import 'package:flutter/material.dart';
// import 'package:wc_form_validators/wc_form_validators.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({ Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     print("reloading");
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset('assets/images/flutter_logo.png', scale: 4.0),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Text(
//                         'Flutter Login',
//                         style: TextStyle(fontSize: 30),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: TextFormField(
//                           controller: email,
//                           decoration: InputDecoration(
//                               border: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(width: 1, color: Colors.grey)),
//                               labelText: 'Email'),
//                           validator: Validators.compose([
//                             Validators.required('email is required'),
//                             Validators.email('invalid email address')
//                           ]),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: TextFormField(
//                           controller: password,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                               border: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(width: 1, color: Colors.grey)),
//                               labelText: 'Password'),
//                           validator: Validators.compose(
//                               [Validators.required('password is required')]),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         child: FlatButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               print(email.text);
//                               print(password.text);
//                               print('success');
//                             }
//                           },
//                           child: Text("Login"),
//                           textColor: Colors.white,
//                           color: Colors.black,
//                           shape: new RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(10)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';

// ;
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/service/services.dart';
import 'package:quiz_app/ui/common_widgets/rounded_button_mine.dart' as button;
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

class LoginPage extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    String selam = 'selam@gmail.com';
    //authController.getdata(context);
    print("the page is reloading on it login ");
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
                              if (value!.isEmpty)
                                return "Email canot be empty ";
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
                              return "Password canot be empty";
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
                      button.RoundedButton(
                          buttonName: 'Login',
                          pressed: () => authController.authenticateUser(
                              context: context,
                              email: authController.loginEmailController.value,
                              emailKey: emailKey,
                              passKey: passKey,
                              password: authController
                                  .loginPasswordController.value)),
                      SizedBox(height: 20), //SizeConfig.screenHeight * 0.03

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
                        ],
                      ),
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
