import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:quiz_app/service/services.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/utils/pallete.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:image_picker/image_picker.dart';

ProfileController pController = Get.put(ProfileController());

Color orangeColor = const Color(0xFFFFA500);
// Color tileColor = Color.fromRGBO(40, 40, 40, 1);
Color tileColor = const Color.fromRGBO(25, 25, 25, 1);
// Color tileColor = Color.fromARGB(227, 20, 20, 20);

Color primaryColor = const Color(0xFFeeeeee);
Color secondaryColor = Colors.white60;

// Custom widgets
Widget customText(BuildContext context, String text, double size, bool isBold,
    bool isPassword, Color textColor) {
  return Text(
    isPassword ? "." * text.length : text.tr,
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
              () => pController.imageFile.value == ''
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        width: 90,
                        height: 90,
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: !kIsWeb
                          ? Image.file(
                              File(pController.imageFile.value),
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                            )
                          : Image.network(
                              pController.imageFile.value,
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
                Obx(() => Text(
                    "${pController.firstName.value}\n${pController.lastName.value}",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                        color: Colors.black))),
                Text('${pController.userInfo.value!.email}',
                    style: const TextStyle(
                        fontSize: 15, height: 1.1, color: Colors.black))
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
    initialLabelIndex: pController.genderIndex.value ? 0 : 1,
    cornerRadius: 10.0,
    activeFgColor: primaryColor,
    inactiveBgColor: Colors.grey[800],
    inactiveFgColor: primaryColor,
    totalSwitches: numberOfSwitches,
    labels: ['Male'.tr, 'Female'.tr],
    activeBgColors: [
      [orangeColor],
      [orangeColor],
    ],
    onToggle: (index) {
      pController.genderIndex.value = !pController.genderIndex.value;
      pController.isBtnNull.value = true;
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
        pController.gender.value ? 'Male' : 'Female',
        style: TextStyle(color: primaryColor),
      ),
    ),
  );
}

Widget buildTileGroup(Widget tiles, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.tertiary,
    ),
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

Widget userInfoTiles(
    BuildContext context, String title, bool padding, bool isPassword) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.tertiary,
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
        style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}

Widget buildTextField(BuildContext context, String hint, IconData? icon,
    TextEditingController ctrl, bool ispassword, Widget? suffix) {
  return TextFormField(
    obscureText: ispassword ? pController.hidePassword.value : false,
    style: TextStyle(
      color: Theme.of(context).colorScheme.onBackground,
    ),
    controller: ctrl,
    onChanged: (value) {
      if (value.trimLeft().isNotEmpty) pController.isBtnNull.value = true;
    },
    decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        focusColor: orangeColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
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
        pController.editedImage.value = pController.imageFile.value;
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
              margin: const EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50))),
              child: Wrap(
                runSpacing: 9,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Center(
                      child: customText(context, 'Contact Us', 26, true, false,
                          Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pController.launchTelegram();
                    },
                    child: buildBottomSheetTiles(
                        FontAwesomeIcons.telegram,
                        customText(context, ' Telegram', 18, false, false,
                            Theme.of(context).colorScheme.onBackground),
                        null,
                        null,
                        true,
                        const Color(0xFF40B3E0)),
                  ),
                  buildBottomSheetTiles(
                      FontAwesomeIcons.solidEnvelope,
                      customText(context, ' quizapp@gmail.com', 18, false,
                          false, Theme.of(context).colorScheme.onBackground),
                      null,
                      null,
                      true,
                      kblue),
                  GestureDetector(
                    onTap: () {
                      pController.launchWebsite();
                    },
                    child: buildBottomSheetTiles(
                        FontAwesomeIcons.earthAmericas,
                        customText(context, ' www.kabbee.org', 18, false, false,
                            Theme.of(context).colorScheme.onBackground),
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

Widget buildUpdateButton(
  BuildContext context,
  text,
  GlobalKey<FormFieldState>? key,
) {
  return TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          pController.isBtnNull.value
              ? orangeColor
              : orangeColor.withOpacity(.1),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        )),
    onPressed: pController.isBtnNull.value
        ? () async {
            await updateProfile(key!, context);
            FocusScope.of(context).unfocus();
            Future.delayed(const Duration(seconds: 3), () {
              context.navigateBack();
            });
          }
        : null,
    child: customText(
      context,
      text,
      20,
      false,
      false,
      Theme.of(context).colorScheme.onBackground,
    ),
  );
}

Widget buildDivider(BuildContext context) {
  return Divider(
    height: 0,
    thickness: 2,
    color: Theme.of(context).scaffoldBackgroundColor,
  );
}

//! Edit profile picture
Widget editProfilePic(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Theme.of(context).colorScheme.tertiary,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(
                () => pController.editedImage.value == ''
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
                                File(pController.editedImage.value),
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              )
                            : Image.network(
                                pController.editedImage.value,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                      ),
              ),
              const SizedBox(width: 12),
              customText(context, 'change_avatar'.tr, 18, false, false,
                  Theme.of(context).colorScheme.onBackground),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              pController.getFromGallery(ImageSource.gallery, context);
            },
            child: Text(
              'Upload'.tr,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).scaffoldBackgroundColor,
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
      pController.hidePassword.value = !pController.hidePassword.value;
    },
    child: Icon(
      pController.hidePassword.value ? Icons.visibility_off : Icons.visibility,
      color: pController.hidePassword.value
          ? orangeColor
          : const Color.fromARGB(255, 255, 165, 0),
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
            child: Center(
                child:
                    customText(context, score, 25, true, false, primaryColor)),
          ),
        ],
      ),
    ),
  );
}

//!  FUNTIONS
updateProfile(GlobalKey<FormFieldState> passwordKey, BuildContext context) {
  pController.gender.value = pController.genderIndex.value;
  pController.userInfo.value!.gender =
      pController.gender.value ? 'Male' : 'Female';

  if (pController.firstNameController.value.text.trimLeft().isNotEmpty) {
    pController.firstName.value =
        pController.firstNameController.value.text.trimLeft();

    pController.userInfo.value!.firstName = pController.firstName.value;
  }

  if (pController.lastNameController.value.text.trimLeft().isNotEmpty) {
    pController.lastName.value =
        pController.lastNameController.value.text.trimLeft();

    pController.userInfo.value!.lastName = pController.lastName.value;
  }

  if (pController.passwordController.value.text.trimLeft().isNotEmpty &&
      passwordKey.currentState!.validate()) {
    pController.password.value =
        pController.passwordController.value.text.toString().trimLeft();
  } else {
    showSnackbar(context, 'Update', 'Profile Updated Successfully', 'success');
  }

  updateJprofile(id: pController.userInfo.value!.id.toString());
  updateProfileImage();

  clearFieldsAndDisableButton();
  showSnackbar(context, 'Update', 'Profile Updated Successful', 'success');

  // Future.delayed(Duration(seconds: 3), () => context.router.navigateBack());
}

updateProfileImage() {
  pController.imageFile.value = pController.editedImage.value;
}

void clearFieldsAndDisableButton() {
  // clear fields
  pController.firstNameController.value.clear();
  pController.lastNameController.value.clear();
  pController.passwordController.value.clear();

  // disable update btn
  pController.isBtnNull.value = false;
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
        // animationType: ANIMATION.fromBottom,
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
        //animationType: ANIMATION.fromBottom,
        animationDuration: const Duration(milliseconds: 500),
        toastDuration: const Duration(seconds: 2),
      ).show(context);
      break;
    default:
  }
}

Widget buildTextFieldP(
    BuildContext context,
    String hint,
    IconData? icon,
    TextEditingController ctrl,
    bool ispassword,
    Widget? suffix,
    GlobalKey key) {
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
    obscureText: ispassword ? pController.hidePassword.value : false,
    style: TextStyle(
      color: Theme.of(context).colorScheme.onBackground,
    ),
    controller: ctrl,
    onChanged: (value) {
      ispassword && !validateStructure(value)
          ? pController.isBtnNull.value = false
          : pController.isBtnNull.value = true;

      if (!ispassword && value.trimLeft().isNotEmpty) {
        pController.isBtnNull.value = true;
      }
    },
    decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        // focusColor: orangeColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
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
        color: Theme.of(context).colorScheme.tertiary,
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
                'TOTAL'.tr,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                ),
              )
            ],
          ),
          Text(
            totalNumber,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
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

// admin users
Widget buildUsersTiles(
    BuildContext context,
    Widget leadingImage,
    String title,
    String subtitle,
    bool isCurrentUserAdmin,
    bool isUserActive,
    bool isUserAdmin,
    user,
    int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: ListTile(
      contentPadding: const EdgeInsets.fromLTRB(10, 1, 20, 1),
      title: customText(context, title, 17, true, false,
          Theme.of(context).colorScheme.onBackground),
      subtitle: customText(context, subtitle, 14, false, false,
          Theme.of(context).colorScheme.onBackground),
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
          ? customText(context, 'You', 14, true, false, kblue)
          : PopupMenuButton(
              position: PopupMenuPosition.under,
              icon: Icon(
                Icons.more_horiz,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              color: kblue,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        final String listId = user['id'].toString();
                        isUserActive
                            ? {
                                pController.updatedPassword.value =
                                    'This#pass123',
                                pController.blockedUsersCount.value += 1,
                                updateUsersList(
                                    id: listId, status: true, index: index),
                              }
                            : {
                                pController.updatedPassword.value =
                                    '${user['firstName']}' '#pass123',
                                if (pController.blockedUsersCount.value != 0)
                                  {
                                    pController.blockedUsersCount.value -= 1,
                                  },
                                updateUsersList(
                                    id: listId, status: false, index: index)
                              };
                      },
                      child: customText(
                          context,
                          isUserActive ? 'Block' : 'Activate',
                          16,
                          true,
                          false,
                          Colors.black),
                    ),
                  ]),
    ),
  );
}

Widget buildlanguageTiles(
  Widget leadingImage,
  String title,
  String subtitle,
  int questionNumber,
  BuildContext context,
) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(10, 1, 20, 1),
        title: customText(context, title, 17, true, false, primaryColor),
        subtitle: customText(
            context, subtitle, 14, false, false, Colors.grey.shade400),
        leading: Container(
          child: leadingImage,
          decoration: BoxDecoration(
            // color: Color.fromARGB(255, 56, 56, 55),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Theme.of(context).colorScheme.background,
            height: 30,
            width: 60,
            child: Center(
                child: Text(
              questionNumber.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            )),
          ),
        ),
      ));
}

class Language {
  final int id;

  final String name;
  final String flag;
  //final String languageCode;

  Language(
    this.id,
    this.name,
    this.flag,
  );
  static List<Language> languageList() {
    return <Language>[
      Language(
        1,
        'English',
        '🇬🇧',
      ),
      Language(
        2,
        'ትግርኛ',
        '🇪🇷',
      ),
    ];
  }
}
// Widget Language() {
//    final int id;
//    final String name;
//    final String flag;
//    final String languageCode;
// }