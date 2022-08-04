// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';

import '../../utils/pallete.dart';

class UserDetailsScreen extends GetView<ProfileController> {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override

  //* User Info

  Widget build(BuildContext context) {
    // print(controller.userInfo.value!.gender);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile'.tr),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            profileCardContent(context),
            customText(context, 'First Name'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(
                context, pController.firstName.value.toString(), true, false)),
            const SizedBox(height: 20),
            customText(context, 'Last Name'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(
                context, pController.lastName.value.toString(), true, false)),
            const SizedBox(height: 20),
            customText(context, 'Email'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(context,
                pController.userInfo.value!.email.toString(), true, false)),
            const SizedBox(height: 20),
            customText(context, 'Password'.tr, 18, false, false,
                Theme.of(context).colorScheme.onBackground),
            const SizedBox(height: 15),
            userInfoTiles(context,
                pController.userInfo.value!.password.toString(), true, true),
            const SizedBox(height: 20),
            customText(context, 'Gender'.tr, 18, false, false, kblue),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(context,
                pController.gender.value ? 'Male' : 'Female', true, false)),
            // userInfoTiles(Text('Esrom'), true),
          ],
        ),
      ),
      floatingActionButton: editIcon(context),
    );
  }
}
