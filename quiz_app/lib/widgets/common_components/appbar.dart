import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../screens/Profile/profile_screen.dart';
import '../theme.dart';
import '../../widgets/user_profile_widget.dart';

AppBar quizeAppbar() {
  return AppBar(
    backgroundColor: appbarColor,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: defaultPadding / 2),
        child: GestureDetector(
          onTap: () {
            Get.to(const ProfileScreen());
          },
          child: profilePic(),
        ),
      )
    ],
  );
}

AppBar quizeAppbar2(String iconUrl) {
  return AppBar(
    title: Center(
      child: CircleAvatar(child: SvgPicture.asset(iconUrl)),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: defaultPadding / 2),
        child: InkWell(
            onTap: () {
              Get.to(const ProfileScreen());
            },
            child: const CircleAvatar(
              foregroundImage: AssetImage("assets/images/profile_pic_demo.jpg"),
            )),
      ),
    ],
  );
}

Widget profilePic() {
  return Obx(
    () => controller.editedImage.value == ''
        ? ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              width: 60,
              height: 60,
              image: AssetImage('assets/images/avatar.png'),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: !kIsWeb
                ? Image.file(
                    File(controller.editedImage.value),
                    fit: BoxFit.fill,
                    width: 60,
                    height: 60,
                  )
                : Image.network(
                    controller.editedImage.value,
                    fit: BoxFit.fill,
                    width: 60,
                    height: 60,
                  ),
          ),
  );
}
