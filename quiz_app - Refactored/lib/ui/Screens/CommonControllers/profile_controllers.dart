import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

import '../../../service/services.dart';

class ProfileController extends GetxController {
  RxBool isDarkMode = true.obs;

  RxBool x = true.obs;
  RxBool y = true.obs;

  RxBool genderIndex = true.obs;
  RxBool gender = true.obs;

  RxBool isBtnNull = false.obs;
  RxBool hidePassword = true.obs;

  var imageFile = ''.obs;
  var editedImage = ''.obs;

// for updating user info
  RxString firstName = 'John'.obs;
  RxString lastName = 'Doe'.obs;
  RxString password = 'test123'.obs;

  Rx<Users?> userInfo = Users().obs;
  List? userList;
  @override
  void onClose() {
    userInfo = Users().obs;
    super.onClose();
  }

  @override
  void onReady() {
    userInfo = Users().obs;
    super.onReady();
  }

  List<CourseScore> scores = [];
  RxList activeUsers = [].obs;
  RxList blockedUsers = [].obs;

  RxInt activeUsersCount = 0.obs;
  RxInt blockedUsersCount = 0.obs;

  RxString updatedPassword = ''.obs;

  Rx<GlobalKey<FormFieldState>> emailFieldKey = GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> passFieldKey = GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> confirmFieldKey =
      GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> firstNameFieldKey =
      GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> lastNameFieldKey =
      GlobalKey<FormFieldState>().obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

// functions

  getFromGallery(ImageSource imgSource, context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: imgSource,
    );
    if (pickedFile != null) {
      editedImage.value = pickedFile.path;
      showSnackbar(context, 'Image', 'Image chosen successfuly', 'success');
      isBtnNull.value = true;
    } else {
      showSnackbar(context, 'Image', 'Failed to choose image', 'error');
    }
  }

  void launchTelegram() async {
    String url = "https://telegram.me/+cbjhHF7ug-pkZjlk";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {}
  }

  void launchWebsite() async {
    String url = "https://kabbee.org/";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {}
  }

  // Dashboard Data

  List categoryLength = [];
  List courseLength = [];
  int usersLength = 0;
  List fetchCoursesAndCategories = [];
  List fetchquestionLengths = [];

  getDashBoardData() async {
    fetchCoursesAndCategories = await fetchDashboard();
    fetchquestionLengths = await fetchquestionLength();
    List fetchUser = await fetchUsers();

    categoryLength =
        fetchCoursesAndCategories.map((e) => e['category']).toSet().toList();

    courseLength =
        fetchCoursesAndCategories.map((e) => e['courseName']).toSet().toList();
    usersLength = fetchUser.length;
  }
}
