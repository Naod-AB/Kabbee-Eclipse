import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/service/model.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:image_picker/image_picker.dart';

ProfileController controller = Get.put(ProfileController());

Color orangeColor = const Color(0xFFFFA500);
Color tileColor = Color.fromRGBO(34, 34, 34, 0.9);
Color primaryColor = const Color(0xFFeeeeee);
Color secondaryColor = Colors.white60;

// Custom widgets
Widget customText(
    String text, double size, bool isBold, bool isPassword, Color textColor) {
  return Text(
    isPassword ? "." * text.length : text,
    softWrap: false,
    textAlign: TextAlign.left,
    style: TextStyle(
        height: 1,
        color: textColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
        fontSize: size),
  );
}

//! Profile Card
Widget profileCardContent(context) {
  var mediaQueryHeight = MediaQuery.of(context).size.height;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: orangeColor,
    ),
    margin: const EdgeInsets.only(bottom: 30),
    height: mediaQueryHeight / 6,
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => controller.imageFile.value == ''
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        width: 110,
                        height: 110,
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: !kIsWeb
                          ? Image.file(
                              File(controller.imageFile.value),
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                            )
                          : Image.network(
                              controller.imageFile.value,
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                            ),
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => customText(
                    "${controller.firstName.value}\n${controller.lastName.value}",
                    30,
                    true,
                    false,
                    Colors.black)),
                customText('${controller.userInfo.value!.email}', 15, false,
                    false, Colors.black45),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Widget genderToggle(int numberOfSwitches) {
  return ToggleSwitch(
    minWidth: 70.0,
    initialLabelIndex: controller.genderIndex.value ? 0 : 1,
    cornerRadius: 10.0,
    activeFgColor: primaryColor,
    inactiveBgColor: Colors.grey[800],
    inactiveFgColor: primaryColor,
    totalSwitches: numberOfSwitches,
    labels: const ['Male', 'Female'],
    activeBgColors: [
      [orangeColor],
      [orangeColor],
    ],
    onToggle: (index) {
      controller.genderIndex.value = !controller.genderIndex.value;
      controller.isBtnNull.value = true;
    },
  );
}

Widget genderValueContainer() {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromRGBO(50, 50, 50, 1),
        borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Text(
        controller.gender.value ? 'Male' : 'Female',
        style: TextStyle(color: primaryColor),
      ),
    ),
  );
}

Widget buildTileGroup(Widget tiles) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: tileColor),
    child: tiles,
  );
}

Widget buildTile(IconData? leadingIcon, Widget? title, Widget? subtitle,
    Widget? trailing, bool padding) {
  return Padding(
    padding:
        padding ? const EdgeInsets.only(left: 10, right: 10) : EdgeInsets.zero,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: title,
      subtitle: subtitle,
      leading: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: orangeColor,
        ),
        child: Icon(
          leadingIcon,
          size: 27,
          color: Colors.white,
        ),
      ),
      trailing: trailing,
    ),
  );
}

Widget buildBottomSheetTiles(IconData? leadingIcon, Widget? title,
    Widget? subtitle, Widget? trailing, bool padding, Color? iconColor) {
  return Padding(
    padding:
        padding ? const EdgeInsets.only(left: 10, right: 10) : EdgeInsets.zero,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: title,
      subtitle: subtitle,
      leading: Icon(
        leadingIcon,
        size: 40,
        color: iconColor,
      ),
      trailing: trailing,
    ),
  );
}

// admin users
Widget buildUsersTiles(
    Widget leadingImage,
    String title,
    String subtitle,
    bool isCurrentUserAdmin,
    bool isUserActive,
    bool isUserAdmin,
    user,
    int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: ListTile(
      contentPadding: const EdgeInsets.fromLTRB(10, 1, 20, 1),
      title: customText(title, 17, true, false, primaryColor),
      subtitle: customText(subtitle, 14, false, false, Colors.grey.shade400),
      leading: Container(
        child: isUserAdmin
            ? Stack(
                children: [
                  leadingImage,
                  const Positioned(
                    top: 25,
                    right: 1,
                    child: FractionalTranslation(
                      translation: Offset(0.5, -0.5),
                      child: Icon(
                        Icons.verified_user,
                        color: kblue,
                        size: 17,
                      ),
                    ),
                  )
                ],
              )
            : leadingImage,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      trailing: isCurrentUserAdmin
          ? customText('You', 14, true, false, kblue)
          : PopupMenuButton(
              position: PopupMenuPosition.under,
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              color: kblue,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        final String listId = user['id'].toString();

                        isUserActive
                            ? {
                                controller.updatedPassword.value =
                                    'This#pass123',
                                updateUsersList(
                                    id: listId, status: true, index: index),
                              }
                            : {
                                controller.updatedPassword.value =
                                    '${user['firstName']}' '#pass123',
                                updateUsersList(
                                    id: listId, status: false, index: index)
                              };
                      },
                      child: customText(isUserActive ? 'Block' : 'Activate', 16,
                          true, false, Colors.black),
                    ),
                  ]),
    ),
  );
}

Widget userInfoTiles(String title, bool padding, bool isPassword) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: tileColor,
    ),
    padding:
        padding ? const EdgeInsets.only(left: 10, right: 10) : EdgeInsets.zero,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: Text(
        isPassword ? "." * title.length : title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

Widget buildTextField(String hint, IconData? icon, TextEditingController ctrl,
    bool ispassword, Widget? suffix) {
  return TextFormField(
    obscureText: ispassword ? controller.hidePassword.value : false,
    style: const TextStyle(color: Colors.white),
    controller: ctrl,
    onChanged: (value) {
      if (value.trimLeft().isNotEmpty) controller.isBtnNull.value = true;
    },
    decoration: InputDecoration(
        fillColor: tileColor,
        filled: true,
        hintStyle: const TextStyle(color: Colors.white),
        focusColor: orangeColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: orangeColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: orangeColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint),
  );
}

//! Floating Action Button
Widget editIcon(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: orangeColor,
    ),
    height: 70,
    width: 70,
    padding: const EdgeInsets.all(5),
    child: FloatingActionButton(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      child: const Icon(
        Icons.edit,
        size: 30,
      ),
      onPressed: () {
        controller.editedImage.value = controller.imageFile.value;
        clearFieldsAndDisableButton();
        context.router.pushNamed('/edit_profile');
      },
    ),
  );
}

Widget contactEditIcon(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: orangeColor,
    ),
    height: 70,
    width: 70,
    padding: const EdgeInsets.all(5),
    child: FloatingActionButton(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      child: const Icon(
        Icons.call,
        size: 30,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          backgroundColor: kblue,
          builder: (context) {
            return Container(
              margin: EdgeInsets.only(top: 3),
              decoration: const BoxDecoration(
                  color: Color(0xFF222222),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: Wrap(
                runSpacing: 9,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Center(
                      child: customText(
                          'Contact Us', 26, true, false, primaryColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.launchTelegram();
                    },
                    child: buildBottomSheetTiles(
                        FontAwesomeIcons.telegram,
                        customText(' Telegram', 18, false, false, primaryColor),
                        null,
                        null,
                        true,
                        Color(0xFF40B3E0)),
                  ),
                  buildBottomSheetTiles(
                      FontAwesomeIcons.solidEnvelope,
                      customText(
                          ' quizapp@gmail.com', 18, false, false, primaryColor),
                      null,
                      null,
                      true,
                      kblue),
                  GestureDetector(
                    onTap: () {
                      controller.launchWebsite();
                    },
                    child: buildBottomSheetTiles(
                        FontAwesomeIcons.earthAmericas,
                        customText(
                            ' www.kabbee.org', 18, false, false, primaryColor),
                        null,
                        null,
                        true,
                        Colors.green),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        );
      },
    ),
  );
}

Widget buildButton(BuildContext context, text, GlobalKey<FormFieldState>? key) {
  return TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            controller.isBtnNull.value ? orangeColor : tileColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        )),
    onPressed: controller.isBtnNull.value
        ? () {
            updateProfile(key!, context);
          }
        : null,
    child: customText(text, 20, false, false, primaryColor),
  );
}

Widget buildDivider() {
  return const Divider(
    height: 0,
    thickness: 2,
    color: Colors.black,
  );
}

//! Edit profile picture
Widget editProfilePic(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: tileColor,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(
                () => controller.editedImage.value == ''
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Image(
                          width: 60,
                          height: 60,
                          image: const AssetImage('assets/images/avatar.png'),
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: !kIsWeb
                            ? Image.file(
                                File(controller.editedImage.value),
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              )
                            : Image.network(
                                controller.editedImage.value,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                      ),
              ),
              const SizedBox(width: 12),
              customText('Change avatar', 18, false, false, primaryColor),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              controller.getFromGallery(ImageSource.gallery, context);
            },
            child: const Text('Upload'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[800],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget passwordVisibilityBtn() {
  return GestureDetector(
    onTap: () {
      controller.hidePassword.value = !controller.hidePassword.value;
    },
    child: Icon(
      controller.hidePassword.value ? Icons.visibility_off : Icons.visibility,
      color: controller.hidePassword.value ? orangeColor : Colors.white,
    ),
  );
}

Widget sampleCard(context, IconData icon, String score) {
  var mediaQueryHeight = MediaQuery.of(context).size.height;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: tileColor,
      border: Border.all(
        color: const Color.fromRGBO(255, 255, 255, .2),
        width: 1.0,
      ),
    ),
    margin: const EdgeInsets.only(bottom: 25),
    height: mediaQueryHeight / 7,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: orangeColor,
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
            child:
                Center(child: customText(score, 25, true, false, primaryColor)),
          ),
        ],
      ),
    ),
  );
}

//!  FUNTIONS

void updateProfile(
    GlobalKey<FormFieldState> passwordKey, BuildContext context) {
  controller.gender.value = controller.genderIndex.value;
  controller.userInfo.value!.gender =
      controller.gender.value ? 'Male' : 'Female';

  if (controller.firstNameController.value.text.trimLeft().isNotEmpty) {
    controller.firstName.value =
        controller.firstNameController.value.text.trimLeft();

    controller.userInfo.value!.firstName = controller.firstName.value;
  }

  if (controller.lastNameController.value.text.trimLeft().isNotEmpty) {
    controller.lastName.value =
        controller.lastNameController.value.text.trimLeft();

    controller.userInfo.value!.lastName = controller.lastName.value;
  }

  if (controller.passwordController.value.text.trimLeft().isNotEmpty &&
      passwordKey.currentState!.validate()) {
    controller.password.value =
        controller.passwordController.value.text.toString().trimLeft();
  } else {
    showSnackbar(context, 'Update', 'Profile Updated Successfully', 'success');
  }

  updateJprofile(id: controller.userInfo.value!.id.toString());

  showSnackbar(context, 'Update', 'Profile Updated Successfully', 'success');
  // Future.delayed(Duration(seconds: 3), () => context.router.navigateBack());

  updateProfileImage();

  clearFieldsAndDisableButton();
}

updateProfileImage() {
  controller.imageFile.value = controller.editedImage.value;
}

void clearFieldsAndDisableButton() {
  // clear fields
  controller.firstNameController.value.clear();
  controller.lastNameController.value.clear();
  controller.passwordController.value.clear();

  // disable update btn
  controller.isBtnNull.value = false;
}

// !  Snackbar

showSnackbar(
    BuildContext context, String title, String message, String snackBartype) {
  switch (snackBartype) {
    case 'success':
      MotionToast.success(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: Text(message),
        borderRadius: 0,
        animationType: ANIMATION.fromBottom,
        animationDuration: const Duration(milliseconds: 300),
        toastDuration: const Duration(seconds: 2),
      ).show(context);

      break;
    case 'error':
      MotionToast.error(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: Text(message),
        borderRadius: 0,
        animationType: ANIMATION.fromBottom,
        animationDuration: const Duration(milliseconds: 500),
        toastDuration: const Duration(seconds: 2),
      ).show(context);
      break;
    default:
  }
}

Widget buildTextFieldP(String hint, IconData? icon, TextEditingController ctrl,
    bool ispassword, Widget? suffix, GlobalKey key) {
  return TextFormField(
    key: key,
    // validator: (value) {
    //   if (!validateStructure(value!)) {
    //     controller.isBtnNull.value = false;
    //     return "Enter a valide Password";
    //   } else {
    //     controller.isBtnNull.value = true;
    //   }

    //   return null;
    // },
    obscureText: ispassword ? controller.hidePassword.value : false,
    style: const TextStyle(color: Colors.white),
    controller: ctrl,
    onChanged: (value) {
      ispassword && !validateStructure(value)
          ? controller.isBtnNull.value = false
          : controller.isBtnNull.value = true;

      if (!ispassword && value.trimLeft().isNotEmpty) {
        controller.isBtnNull.value = true;
      }
    },
    decoration: InputDecoration(
        fillColor: tileColor,
        filled: true,
        hintStyle: const TextStyle(color: Colors.white),
        focusColor: orangeColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: orangeColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        // prefixIcon: Icon(
        //   icon,
        //   color: orangeColor,
        // ),
        suffixIcon: suffix,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: orangeColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint),
  );
}

Widget buildDashBoardTiles(
  BuildContext context,
  String text,
  double size,
  String totalNumber,
  double totalNumberSize,
) {
  return Container(
    width: 376.0,
    height: 140,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: tileColor,
        border: Border.all(color: kblue, width: 3)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TOTAL',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                ),
              )
            ],
          ),
          Text(
            totalNumber,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: totalNumberSize,
            ),
          )
        ],
      ),
    ),
  );
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
