import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';

import '../../utils/pallete.dart';

class EditProfileScreen extends GetView<ProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormFieldState> pkey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Edit Profile'.tr),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          //physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            customText(context, 'First Name'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            Obx(
              () => buildTextField(
                  context,
                  pController.firstName.value,
                  Icons.person,
                  pController.firstNameController.value,
                  false,
                  null),
            ),
            const SizedBox(height: 20),
            customText(context, 'Last Name'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            Obx(
              () => buildTextField(
                  context,
                  pController.lastName.value,
                  Icons.person,
                  pController.lastNameController.value,
                  false,
                  null),
            ),
            const SizedBox(height: 20),
            customText(context, 'Password'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            Obx(
              () => buildTextFieldP(
                  context,
                  'enter_new_password'.tr,
                  Icons.lock,
                  pController.passwordController.value,
                  true,
                  passwordVisibilityBtn(),
                  pkey),
            ),
            const SizedBox(height: 20),
            Obx(() => buildTile(
                  controller.gender.value ? Icons.male : Icons.female,
                  customText(context, 'Gender'.tr, 18, true, false,
                      Theme.of(context).colorScheme.onBackground),
                  null,
                  genderToggle(2),
                  false,
                )),
            const SizedBox(height: 20),
            editProfilePic(context),
            const SizedBox(height: 40),
            Obx(() => buildUpdateButton(context, 'UPDATE', pkey)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
