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
import '../../utils/theme.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Account'.tr),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            //  Personal section

            profileCardContent(context),
            customText(context, 'Profile'.tr, 20, false, false,
                Theme.of(context).colorScheme.onBackground),
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
                      customText(context, 'Personal'.tr, 18, true, false,
                          Theme.of(context).colorScheme.onBackground),
                      customText(
                          context,
                          'View and update profile'.tr,
                          13,
                          false,
                          false,
                          Theme.of(context).colorScheme.onBackground),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      true,
                    ),
                  ),
                  // buildDivider(),
                ],
              ),
              context,
            ),

            // Admin settings

            if (controller.userInfo.value!.role == 'ADMIN')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  customText(context, 'Admin Settings'.tr, 20, false, false,
                      Theme.of(context).colorScheme.onBackground),
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
                            customText(context, 'Dashboard'.tr, 18, true, false,
                                Theme.of(context).colorScheme.onBackground),
                            customText(
                                context,
                                'Statistics'.tr,
                                13,
                                false,
                                false,
                                Theme.of(context).colorScheme.onBackground),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            true,
                          ),
                        ),
                        // buildDivider(),
                      ],
                    ),
                    context,
                  ),
                ],
              ),

            // Other features section

// ......
            const SizedBox(height: 20),
            customText(context, 'Other', 20, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            buildTileGroup(
              Column(
                children: [
                  buildTile(
                      Icons.dark_mode,
                      customText(context, 'Dark Mode'.tr, 18, true, false,
                          Theme.of(context).colorScheme.onBackground),
                      customText(context, 'Change theme'.tr, 13, false, false,
                          Theme.of(context).colorScheme.onBackground),
                      Obx(
                        () => Switch.adaptive(
                          value: controller.isDarkMode.value,
                          activeColor: orangeColor,
                          onChanged: (value) {
                            controller.isDarkMode.value =
                                !controller.isDarkMode.value;

                            Get.changeTheme(controller.isDarkMode.value
                                ? Themes.darkMode
                                : Themes.lightMode);

                            // if (Get.isDarkMode) {
                            //   print('change to light');
                            //   // Get.changeThemeMode(ThemeMode.light);
                            // } else {
                            //   // print('dark $ThemeData()')
                            //   // Get.changeThemeMode(ThemeMode.dark);
                            //   print('change to dark ');
                            // }
                            // isdarkthemeEnabled = changeTheme;
                            // print('dark theme is $isdarkthemeEnabled');
                          },
                        ),
                      ),
                      true),
                  buildDivider(context),
                  GestureDetector(
                    onTap: () async {
                      controller.scores =
                          await fetchUserScores(controller.userInfo.value!.id);

                      context.router.pushNamed('/my_scores');
                    },
                    child: buildTile(
                        Icons.celebration,
                        customText(context, 'My Scores'.tr, 18, true, false,
                            Theme.of(context).colorScheme.onBackground),
                        customText(context, 'Achievements'.tr, 13, false, false,
                            Theme.of(context).colorScheme.onBackground),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        true),
                  ),
                  buildDivider(context),
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
                        customText(context, 'Recommendations'.tr, 18, true,
                            false, Theme.of(context).colorScheme.onBackground),
                        customText(
                            context,
                            'kabbee recommend you to Visit'.tr,
                            13,
                            false,
                            false,
                            Theme.of(context).colorScheme.onBackground),
                        Icon(
                          Icons.view_carousel_outlined,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        true),
                  ),
                  buildDivider(context),
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
                        customText(context, 'Log Out'.tr, 18, true, false,
                            Theme.of(context).colorScheme.onBackground),
                        customText(
                            context,
                            'Exit from the application'.tr,
                            13,
                            false,
                            false,
                            Theme.of(context).colorScheme.onBackground),
                        null,
                        true),
                  )
                ],
              ),
              context,
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
