import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controllers.dart';
import '../widgets/user_profile_widget.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            customText('Edit Profile', 30, true, false, primaryColor),
            const SizedBox(height: 30),
            editProfilePic(context),
            const SizedBox(height: 20),
            buildTextField('Enter first name', Icons.person,
                controller.firstNameController.value, false, null),
            const SizedBox(height: 20),
            buildTextField('Enter last name', Icons.person,
                controller.lastNameController.value, false, null),
            const SizedBox(height: 20),
            Obx(
              () => buildTextField(
                  'Enter password ',
                  Icons.lock,
                  controller.passwordController.value,
                  true,
                  passwordVisibilityBtn()),
            ),
            const SizedBox(height: 20),
            Obx(() => buildTile(
                  controller.genderIndex.value ? Icons.male : Icons.female,
                  customText('Gender', 18, true, false, primaryColor),
                  null,
                  genderToggle(2),
                  false,
                )),
            const SizedBox(height: 30),
            Obx(
              () => buildButton(context, 'UPDATE'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
