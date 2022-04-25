import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'login3.dart';

class Login2 extends StatelessWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // width:

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
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  icon: FontAwesomeIcons.lock,
                  hint: 'Comfirm password',
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Regi(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Enter password',
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 145,
                ),
                GestureDetector(
                  child: RoundedButton(
                    buttonName: 'LOG IN',
                    page: Login3(),
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
    );
  }
}
