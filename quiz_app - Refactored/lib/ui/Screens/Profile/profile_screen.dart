// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/service/services.dart';
//import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/Screens/Question/models/courses.dart';
// import '../Profile/widgets/user_profile_widget.dart';

// import '../../../routes/router.gr.dart';
import '../../../routes/router.gr.dart';
import '../../../webviewSlider.dart';

//bool isdarkthemeEnabled = false;
class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);
  //bool isdarkthemeEnabled = false;
  // Widget Build(BuildContext context) {
  //   return MaterialApp(
  //     theme: isdarkthemeEnabled ? ThemeData.dark() : ThemeData.light(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
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
            //  Personal section

            profileCardContent(context),
            customText('Profile'.tr, 20, false, false, primaryColor),
            const SizedBox(height: 15),

            buildTileGroup(
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.pushNamed('/personal_details');
                    },
                    child: buildTile(
                      Icons.person,
                      customText('Personal'.tr, 18, true, false, primaryColor),
                      customText('View and update profile'.tr, 13, false, false,
                          secondaryColor),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      true,
                    ),
                  ),
                  buildDivider(),
                ],
              ),
            ),

            // Admin settings

            if (controller.userInfo.value!.role == 'ADMIN')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  customText(
                      'Admin Settings'.tr, 20, false, false, primaryColor),
                  const SizedBox(height: 15),
                  buildTileGroup(
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await controller.getDashBoardData();
                            context.router.pushNamed('/dahboard');
                          },
                          child: buildTile(
                            Icons.dashboard,
                            customText(
                                'Dashboard'.tr, 18, true, false, primaryColor),
                            customText('Statistics'.tr, 13, false, false,
                                secondaryColor),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            true,
                          ),
                        ),
                        buildDivider(),
                      ],
                    ),
                  ),
                ],
              ),

            // Other features section

// ......
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
                  //       onChanged: (Value) {
                  //         // setState(() {
                  //         //   isdarkthemeEnabled = changeTheme;
                  //         //   print('dark theme is $isdarkthemeEnabled');
                  //         // });
                  //       },
                  //     ),
                  //     true),
                  buildDivider(),
                  GestureDetector(
                    onTap: () async {
                      print(
                          'Profile DATA MY SCORES ${controller.userInfo.value!.id}');
                      controller.scores =
                          await fetchUserScores(controller.userInfo.value!.id);

                      context.router.pushNamed('/my_scores');
                    },
                    child: buildTile(
                        Icons.celebration,
                        customText(
                            'My Scores'.tr, 18, true, false, primaryColor),
                        customText('Achievements'.tr, 13, false, false,
                            secondaryColor),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        true),
                  ),
                  buildDivider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Webslider()),
                      );
                    },
                    child: buildTile(
                        Icons.recommend_outlined,
                        customText('Recommendations'.tr, 18, true, false,
                            primaryColor),
                        customText('kabbee recommend you to Visit'.tr, 13,
                            false, false, secondaryColor),
                        const Icon(
                          Icons.view_carousel_outlined,
                          color: Colors.white,
                        ),
                        true),
                  ),
                  buildDivider(),
                  GestureDetector(
                    onTap: () {
                      showCupertinoDialog<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: Text('Logging Out'.tr),
                          content: Text('Are You sure you want to log out?'.tr),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              child: Text('No'.tr),
                              onPressed: () {
                                context.router.pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Yes'.tr),
                              isDestructiveAction: true,
                              onPressed: () {
                                // context.router.removeUntil(
                                //     (route) => route.name == Splash.name);
                                // context.router.popUntilRouteWithName('HomeRoute');
                                // context.router.popUntilRoot();
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
                        customText('Log Out'.tr, 18, true, false, primaryColor),
                        customText('Exit from the application'.tr, 13, false,
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

  void setState(isdarkthemeEnabled) {
    isdarkthemeEnabled = false;
  }
}

// void setState(darthemeEnabled) {
//   bool darkthemeEnabled = false;
// }
