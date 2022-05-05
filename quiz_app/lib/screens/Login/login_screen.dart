import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Utilities/size_config.dart';
import '../../widgets/pallete.dart';
import '../../widgets/widgets.dart';
import '../Category/category_screen.dart';

import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/routes/router.gr.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
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
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                 Regi(
                  icon: FontAwesomeIcons.solidEnvelope,
                  hint: 'Enter email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next, 
                  controller: null, 
                  fieldkey: null, 
                  isPass: null, 
                  user: null,
                ),
                const SizedBox(
                  height: 15,
                ),
                const PasswordInput(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Enter password',
                  inputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    CheckboxListTile(
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
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password?',
                          style: kColorText,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  child: const RoundedButton(
                    buttonName: 'Login',
                    page: '/category',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Text(
                      'Don`t have an account',
                      style: kText,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => const SignupEmail());
                        context.router.pushNamed('/signup_email');
                      },
                      child: const Text(
                        'Sign up',
                        style: kColorText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
