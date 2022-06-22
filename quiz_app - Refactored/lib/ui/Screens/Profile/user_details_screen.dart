// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/string_extension.dart';

class UserDetailsScreen extends GetView<ProfileController> {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.userInfo.value!.gender);
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
            profileCardContent(context),
            customText('First Name', 18, false, false, kblue),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(
                controller.firstName.value.toString(), true, false)),
            const SizedBox(height: 20),
            customText('Last Name', 18, false, false, kblue),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(
                controller.lastName.value.toString(), true, false)),
            const SizedBox(height: 20),
            customText('Email', 18, false, false, kblue),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(
                controller.userInfo.value!.email.toString(), true, false)),
            const SizedBox(height: 20),
            customText('Password', 18, false, false, kblue),
            const SizedBox(height: 15),
            userInfoTiles(
                controller.userInfo.value!.password.toString(), true, false),
            const SizedBox(height: 20),
            customText('Gender', 18, false, false, kblue),
            const SizedBox(height: 15),
            Obx(() => userInfoTiles(
                controller.gender.value ? 'Male' : 'Female', true, false)),

            // userInfoTiles(Text('Esrom'), true),
          ],
        ),
      ),
      floatingActionButton: editIcon(context),
    );
  }
}
