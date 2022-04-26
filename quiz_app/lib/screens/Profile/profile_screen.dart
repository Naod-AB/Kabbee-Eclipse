import 'package:flutter/material.dart';

import '../../controllers/profile_controllers.dart';
import '../../controllers/string_extension.dart';
import '../../widgets/user_profile_widget.dart';
import 'package:get/get.dart';
import 'my_scores_screen.dart';


class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
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
                        controller.firstName.value.toCapitalized() +
                            ' ' +
                            controller.lastName.value.toCapitalized(),
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
                        customText(
                            'Current gender', 13, false, false, secondaryColor),
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
                  buildTile(
                      Icons.dark_mode,
                      customText('Dark Mode', 18, true, false, primaryColor),
                      customText(
                          'Change theme', 13, false, false, secondaryColor),
                      Switch.adaptive(
                        value: true,
                        activeColor: orangeColor,
                        onChanged: (value) {},
                      ),
                      true),
                  buildDivider(),
                  buildTile(
                      Icons.celebration,
                      customText('My Scores', 18, true, false, primaryColor),
                      customText(
                          'Achievements', 13, false, false, secondaryColor),
                      GestureDetector(
                        onTap: () => Get.to(() => const MyScoresScreen()),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                      true),
                  buildDivider(),
                  buildTile(
                      Icons.exit_to_app,
                      customText('Log Out', 18, true, false, primaryColor),
                      customText('Exit from the application', 13, false, false,
                          secondaryColor),
                      null,
                      true)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: editIcon(context),
    );
  }
}
