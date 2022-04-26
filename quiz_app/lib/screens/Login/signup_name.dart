import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/user_profile_widget.dart';
import '../../widgets/widgets.dart';
import 'login_screen.dart';

class SignupName extends StatelessWidget {
  const SignupName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        leading: const BackButton(),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Text(
              'Create account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.30),
            ),
            const Text(
              'please tell us more about you',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.50),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Regi(
                  icon: FontAwesomeIcons.solidUser,
                  hint: 'Enter first name',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Regi(
                  icon: FontAwesomeIcons.solidUser,
                  hint: 'Enter last name',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                genderToggle(2),
                const SizedBox(
                  height: 138,
                ),
                GestureDetector(
                  child: const RoundedButton(
                    buttonName: 'Register',
                    page:  LoginPage(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
