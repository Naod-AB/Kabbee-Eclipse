import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../widgets/pallete.dart';
import '../../widgets/widgets.dart';
import '../Category/category_screen.dart';
import 'signup_email.dart';

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
          const Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // ),
          const SizedBox(
            height: 85,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const TextInputField(
              icon: FontAwesomeIcons.solidEnvelope,
              hint: 'Enter email',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
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
              height: 25,
            ),
            GestureDetector(
              child: const RoundedButton(
                buttonName: 'LOG IN',
                page:  CategoryPage(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ]),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don`t have an account',
                style: kBodyText,
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const SignupEmail());
                },
                child: const Text(
                  'Sign up',
                  style: kColorText,
                ),
              ),
            ],
          ),
          // ),

          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
