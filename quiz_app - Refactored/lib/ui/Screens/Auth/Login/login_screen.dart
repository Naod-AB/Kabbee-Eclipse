import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


// ;
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/ui/common_widgets/rounded_button_mine.dart' as button;
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/size_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool rememberMe = false;
  String error = "";
  
  ProfileController profileController = Get.find();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    String selam = 'selam@gmail.com';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(40),
                      fontWeight: FontWeight.bold),
                ),
              ),
              // ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.05),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        key: emailKey,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) return "Email canot be empty ";
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[500]!.withOpacity(0.5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.solidEnvelope,
                              size: 28,
                              color: kblue,
                            ),
                          ),
                          hintText: 'Enter email',
                          hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.02,
                      ),
                      TextFormField(
                        key: passKey,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) return "Password canot be empty";
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[500]!.withOpacity(0.5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _obscureText
                                    ? Color.fromARGB(255, 255, 165, 0)
                                    : Color.fromARGB(255, 255, 165, 0),
                              ),
                            ),
                            // child: Icon(
                            //   FontAwesomeIcons.lock,
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
                        obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.02,
                        //width:SizeConfig.screenHeight *0.5 //25,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenHeight * 0.08),
                        child: CheckboxListTile(
                          title: const Text(
                            'Remember me',
                            style: TextStyle(fontSize: 16, color: kWhite1),
                          ),
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: kblue,
                          checkColor: kblack,
                          side: BorderSide(
                            color: kWhite1, //your desire colour here
                            width: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03, //25,
                      ),
                      button.RoundedButton(
                          buttonName: 'Login', pressed: authenticateUser),
                      SizedBox(height: SizeConfig.screenHeight * 0.03),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don`t have an account',
                            style: kText,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(() => const SignupEmail());
                              context.router.pushNamed('/signup');
                            },
                            child: const Text(
                              'Sign up',
                              style: kColorText,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),

              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void authenticateUser() async {
    var pass = passwordController.text.trim();

    var email = emailController.text.trim().toLowerCase();
    print('email ${emailController.text}');
    if (emailKey.currentState!.validate() && passKey.currentState!.validate()) {
      profileController.userInfo.value = await fetchUser(email);
      if (profileController.userInfo.value != null &&
          profileController.userInfo.value!.password == pass) {
        profileController.scores =
            await fetchUserScores(profileController.userInfo.value!.id);
        // print('from login >>>> ${profileController.scores}');
        setState(() {
          error = "";
        });
        context.router.pushNamed('/category');
      } else {
        setState(() {
          error = "Email address or Password is incorrect";
        });
      }
    }
  }
}
