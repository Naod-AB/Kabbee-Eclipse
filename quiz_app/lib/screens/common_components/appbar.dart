import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

import '../../widgets/user_profile_widget.dart';
import '../profile_screen.dart';

AppBar QuizeAppbar() {
  return AppBar(
    backgroundColor: appbarColor,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: defaultPadding / 2),
        child: GestureDetector(
          onTap: () {
            Get.to(ProfileScreen());
          },
          child: profilePic(),
        ),
      )
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
              image: const AssetImage('assets/images/avatar.png'),
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
