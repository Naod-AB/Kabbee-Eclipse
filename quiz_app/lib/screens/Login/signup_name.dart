import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/widgets/pallete.dart';

import '../../widgets/widgets.dart';
import 'screens.dart';

class SignupName extends StatelessWidget {
  const SignupName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
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
                  /*buildTile(
                    controller.genderIndex.value ? Icons.male : Icons.female,
                    customText('Gender', 18, true, false, primaryColor),
                    null,
                    genderToggle(2),
                    false,
                  ),*/
                  TextG(
                      //genderToggle(2),
                      ),
                  //genderValueContainer(),
                  /*Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Gender',
                            style: kBodyText,
                          ),
                          suffixText:Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: genderToggle(2),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  const SizedBox(
                    height: 110,
                  ),
                  GestureDetector(
                    child: const RoundedButton(
                      buttonName: 'REGISTER',
                      page: LoginPage(),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
