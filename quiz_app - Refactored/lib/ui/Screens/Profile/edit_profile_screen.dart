import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';


class EditProfileScreen extends GetView<ProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);
  Users user = Users();
  GlobalKey<FormFieldState> pkey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              customText('Edit Profile', 30, true, false, primaryColor),
              const SizedBox(height: 30),
              editProfilePic(context),
              const SizedBox(height: 20),
              buildTextField(
                  '${controller.userInfo.value!.firstName}',
                  Icons.person,
                  controller.firstNameController.value,
                  false,
                  null),
              const SizedBox(height: 20),
              buildTextField(
                  '${controller.userInfo.value!.lastName}',
                  Icons.person,
                  controller.lastNameController.value,
                  false,
                  null),
              const SizedBox(height: 20),
              Obx(
                () => buildTextFieldP(
                    'Enter new password ',
                    Icons.lock,
                    controller.passwordController.value,
                    true,
                    passwordVisibilityBtn(),
                    pkey),
              ),
              const SizedBox(height: 20),
              Obx(() => buildTile(
                    controller.userInfo.value!.gender == 'Male'
                        ? Icons.male
                        : Icons.female,
                    customText('Gender', 18, true, false, primaryColor),
                    null,
                    genderToggle(2),
                    false,
                  )),
              const SizedBox(height: 30),
              Obx(
                () => buildButton(context, 'UPDATE', pkey),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
