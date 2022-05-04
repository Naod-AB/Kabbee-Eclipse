import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/widgets/pallete.dart';

import '../../widgets/widgets.dart';
//import 'screens.dart';

class SignupName extends StatelessWidget {
  const SignupName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        leading: const BackButton(),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        //height: 200,
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Create account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
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

                    TextG(),

                    const SizedBox(
                      height: 125,
                    ),

                    GestureDetector(
                      child: const RoundedButton(
                        buttonName: 'REGISTER',
                        page: '/login',
                      ),
                    ),
                    //const SizedBox(
                    // height: 40,
                    //),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
