import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/widgets/pallete.dart';

import '../../widgets/widgets.dart';
import 'screens.dart';

class SignupPassword extends StatelessWidget {
  const SignupPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        leading: const BackButton(),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Create account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'please enter your password',
                  style: TextStyle(
                      color: kWhite1,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 0.50),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Comfirm password',
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Enter password',
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 225,
                  ),
                  GestureDetector(
                    child: RoundedButton(
                      buttonName: 'NEXT',
                      page: const SignupName(),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
