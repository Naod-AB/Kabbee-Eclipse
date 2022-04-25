import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/screens/category_screen/category_screen.dart';

import '../../widgets/user_profile_widget.dart';
import '../../widgets/widgets.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
                  child: RoundedButton(
                    buttonName: 'LOG IN',
                    page: const CategoryPage(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                /*Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.lock,
                            size: 28,
                            color: Color(0x64FFA500),
                          ),
                        ),
                        hintText: 'Confirm password',
                        hintStyle: TextStyle(
                          //fontFamily: cai
                          fontSize: 16,
                          color: Colors.white38,
                          // fontFamily: 'Cairo',
                          //fontStyle: FontStyle.normal,
                        ),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                )*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
