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

import '../../../webviewSlider.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isUserAdmin = false;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            //!  Personal section
            profileCardContent(context),
            customText('Profile', 20, false, false, primaryColor),
            const SizedBox(height: 15),
            buildTileGroup(
              Column(
                children: [
                  buildTile(
                    Icons.person,
                    customText('Personal', 18, true, false, primaryColor),
                    customText('View and update profile', 13, false, false,
                        secondaryColor),
                    GestureDetector(
                      onTap: () {
                        print('object');
                        context.router.pushNamed('/personal_details');
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                    true,
                  ),
                  buildDivider(),
                ],
              ),
            ),

            // Admin settings

            if (isUserAdmin == true)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  customText('Admin Settings', 20, false, false, primaryColor),
                  const SizedBox(height: 15),
                  buildTileGroup(
                    Column(
                      children: [
                        buildTile(
                          Icons.dashboard,
                          customText(
                              'Dashboard', 18, true, false, primaryColor),
                          customText('View and update profile', 13, false,
                              false, secondaryColor),
                          GestureDetector(
                            onTap: () {
                              print('Go to admin dashboard');
                              // context.router.pushNamed('/personal_details');
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                          true,
                        ),
                        buildDivider(),
                      ],
                    ),
                  ),
                ],
              ),

            // Other features section
            const SizedBox(height: 20),
            customText('Other', 20, false, false, primaryColor),
            const SizedBox(height: 15),
            buildTileGroup(
              Column(
                children: [
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
                  buildTile(
                      Icons.recommend_outlined,
                      customText(
                          'Recommendations', 18, true, false, primaryColor),
                      customText('kabbee recommend you to Visit', 13, false,
                          false, secondaryColor),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Webslider()),
                          );
                        },
                        child: const Icon(
                          Icons.view_carousel_outlined,
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
      floatingActionButton: contactEditIcon(context),
    );
  }
}
