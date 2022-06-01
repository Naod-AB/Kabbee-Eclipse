// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:quiz_app/routes/router.gr.dart';


import 'package:get/get.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/string_extension.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.firstName.value =
        controller.userInfo.value!.firstName.toString().toCapitalized();
    controller.lastName.value =
        controller.userInfo.value!.lastName.toString().toCapitalized();

    controller.gender.value =
        controller.userInfo.value!.gender.toString() == 'Male' ? true : false;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            profileCardContent(context),
            customText('Account', 20, false, false, primaryColor),
            const SizedBox(height: 15),
            buildTileGroup(
              Column(
                children: [
                  buildTile(
                    Icons.person,
                    customText('Full Name', 18, true, false, primaryColor),
                    Obx(() => customText(
                        controller.userInfo.value!.firstName
                                .toString()
                                .toCapitalized() +
                            ' ' +
                            controller.userInfo.value!.lastName
                                .toString()
                                .toCapitalized(),
                        13,
                        false,
                        false,
                        secondaryColor)),
                    null,
                    true,
                  ),
                  buildDivider(),
                  Obx(() => buildTile(
                      Icons.lock,
                      customText('Password', 18, true, false, primaryColor),
                      customText(controller.password.value, 13, false, true,
                          secondaryColor),
                      null,
                      true)),
                  buildDivider(),
                  Obx(() => buildTile(
                        controller.gender.value ? Icons.male : Icons.female,
                        customText('Gender', 18, true, false, primaryColor),
                        customText('Selected gender', 13, false, false,
                            secondaryColor),
                        genderValueContainer(),
                        true,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            customText('Other', 20, false, false, primaryColor),
            const SizedBox(height: 15),
            buildTileGroup(
              Column(
                children: [
                  // buildTile(
                  //     Icons.dark_mode,
                  //     customText('Dark Mode', 18, true, false, primaryColor),
                  //     customText(
                  //         'Change theme', 13, false, false, secondaryColor),
                  //     Switch.adaptive(
                  //       value: true,
                  //       activeColor: orangeColor,
                  //       onChanged: (value) {},
                  //     ),
                  //     true),

                  buildDivider(),
                  buildTile(
                      Icons.celebration,
                      customText('My Scores', 18, true, false, primaryColor),
                      customText(
                          'Achievements', 13, false, false, secondaryColor),
                      GestureDetector(
                        onTap: () async {
                          controller.scores = await fetchUserScores(
                              controller.userInfo.value!.id);

                          context.router.pushNamed('/my_scores');
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                      true),
                  buildDivider(),

                  GestureDetector(
                    onTap: () {
                      showCupertinoDialog<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Logging Out'),
                          content:
                              const Text('Are You sure you want to log out?'),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              child: const Text('No'),
                              onPressed: () {
                                context.router.pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: const Text('Yes'),
                              isDestructiveAction: true,
                              onPressed: () {
                                context.router.removeUntil(
                                    (route) => route.name == LoginRoute.name);
                                logOut();
                              },
                            )
                          ],
                        ),
                      );

                      print('object');
                    },
                    child: buildTile(
                        Icons.exit_to_app,
                        customText('Log Out', 18, true, false, primaryColor),
                        customText('Exit from the application', 13, false,
                            false, secondaryColor),
                        null,
                        true),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          contactEditIcon(context),
          editIcon(context),
        ],
      ),
    );
  }
}
