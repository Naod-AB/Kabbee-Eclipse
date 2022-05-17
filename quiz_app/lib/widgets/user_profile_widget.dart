import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:quiz_app/Models/users.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../Models/model.dart';
import '../controllers/string_extension.dart';
import '../controllers/profile_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/Profile/edit_profile_screen.dart';
import '../screens/Score/final_practice_score.dart';

ProfileController controller = Get.find();

// Color tileColor = Color.fromRGBO(25, 25, 25, 1);
Color orangeColor = const Color(0xFFFFA500);
Color tileColor = const Color(0xFF111111);
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
  controller.firstName.value =
      controller.userInfo.value!.firstName.toString().toCapitalized();
  controller.lastName.value =
      controller.userInfo.value!.lastName.toString().toCapitalized();

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
                    // "${controller.firstName.value = controller.userInfo.value.firstName.toString().toCapitalized()}\n${controller.userInfo.value.lastName.toString().toCapitalized()}",
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

    // icons: const [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
    activeBgColors: [
      [orangeColor],
      [orangeColor],
    ],
    onToggle: (index) {
      // controller.genderIndex.value == 'Male'
      //     ? controller.genderIndex.value = 'Female'
      //     : controller.genderIndex.value = 'Male';
      controller.genderIndex.value = !controller.genderIndex.value;
      controller.isBtnNull.value = true;
      //gender=controller.selectedGender.value;
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
        // controller.userInfo.value.gender.toString().toCapitalized(),
        style: TextStyle(color: primaryColor),
      ),
    ),
  );
}

Widget buildTileGroup(Widget tiles) {
  return Container(
    // padding: EdgeInsets.only(left: 10, right: 10),
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
          size: 25,
          color: Colors.white,
        ),
      ),
      trailing: trailing,
    ),
  );
}

Widget buildTextField(String hint, IconData icon, TextEditingController ctrl,
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
        prefixIcon: Icon(
          icon,
          color: orangeColor,
        ),
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
        // controller.genderIndex.value =
        //     controller.userInfo.value.gender.toString();
        controller.editedImage.value = controller.imageFile.value;
        clearFieldsAndDisableButton();
        context.router.pushNamed('/edit_profile');
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
            if (key!.currentState!.validate()) {
              showSnackbar(
                  context, 'Update', 'Profile Updated Successfully', 'success');

              context.router.navigateBack();
              updateProfile();
              updateJprofile(id: controller.userInfo.value!.id.toString());
            }
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
              primary: orangeColor,
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
      print('object');
    },
    child: Icon(
      controller.hidePassword.value ? Icons.visibility_off : Icons.visibility,
      color: controller.hidePassword.value ? orangeColor : Colors.white,
    ),
  );
}

Widget sampleCard(context, IconData icon) {
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
            child: Center(
                child: customText('10/10', 25, true, false, primaryColor)),
          ),
        ],
      ),
    ),
  );
}

//!  FUNTIONS

void updateProfile() {
  print('profile updated');
  controller.gender.value = controller.genderIndex.value;
  print(controller.gender.value);

  if (controller.firstNameController.value.text.trimLeft().isNotEmpty) {
    controller.firstName.value =
        controller.firstNameController.value.text.trimLeft();
    print('Firstname');
  } else {
    controller.firstName.value =
        controller.userInfo.value!.firstName.toString();
  }
  if (controller.lastNameController.value.text.trimLeft().isNotEmpty) {
    controller.lastName.value =
        controller.lastNameController.value.text.trimLeft();
  } else {
    controller.lastName.value = controller.userInfo.value!.lastName.toString();
  }

  if (controller.passwordController.value.text.trimLeft().isNotEmpty) {
    controller.password.value =
        controller.passwordController.value.text.toString().trimLeft();
  } else {
    controller.password.value = controller.userInfo.value!.password.toString();
  }
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
        animationDuration: const Duration(milliseconds: 500),
        toastDuration: const Duration(seconds: 3),
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

Widget buildTextFieldP(String hint, IconData icon, TextEditingController ctrl,
    bool ispassword, Widget? suffix, GlobalKey key) {
  return TextFormField(
    key: key,
    validator: (value) {
      if (!validateStructure(value!)) {
        return "Enter a valide Password";
      }
    },
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
        prefixIcon: Icon(
          icon,
          color: orangeColor,
        ),
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

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
