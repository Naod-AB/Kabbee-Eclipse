import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/widgets/pallete.dart';

import '../../widgets/widgets.dart';
import 'screens.dart';

class SignupEmail extends StatelessWidget {
  const SignupEmail({Key? key}) : super(key: key);

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
            //width: size.width * 0.8,
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Create account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'please tell us more about you',
                  style: TextStyle(
                      color: kWhite1,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.50),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Regi(
                    icon: FontAwesomeIcons.solidEnvelope,
                    hint: 'Enter email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 241,
                  ),
                  RoundedButton(
                    buttonName: 'NEXT',
                    page: '/signup_password',
                  ),
                  const SizedBox(
                    height: 45,
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
