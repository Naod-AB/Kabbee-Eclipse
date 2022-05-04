import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Utilities/size_config.dart';
import '../../widgets/pallete.dart';
import '../../widgets/widgets.dart';
import '../Category/category_screen.dart';
import 'signup_email.dart';
import 'signup_onepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const TextInputField(
              icon: FontAwesomeIcons.solidEnvelope,
              hint: 'Enter email',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              
            ),
             SizedBox(
              height: SizeConfig.screenHeight *0.02,
            ),
            const PasswordInput(
              icon: FontAwesomeIcons.lock,
              hint: 'Enter password',
              inputAction: TextInputAction.done,
            ),
             SizedBox(
              height:SizeConfig.screenHeight *0.03, //25,
            ),
            GestureDetector(
              child:  RoundedButton(
                buttonName: 'Login',
                page:  CategoryPage(),
              ),
            ),
             SizedBox(
              height:SizeConfig.screenHeight *0.03
            ),
          ]),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don`t have an account',
                style: kBodyText,
              ),
               SizedBox(
                width: SizeConfig.screenWidth * 0.03//15,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => OneSignupPage()//const SignupEmail()
                  );
                },
                child: const Text(
                  'Sign up',
                  style: kColorText,
                ),
              ),
            ], 
          ),
          // ),

           SizedBox(
           height:SizeConfig.screenHeight *0.03,
          ),
        ],
      ),
    );
  }
}
