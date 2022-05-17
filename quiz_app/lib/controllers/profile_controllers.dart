import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/Models/users.dart';

import '../Models/scores.dart';
import '../api.dart';
import '../widgets/user_profile_widget.dart';

class ProfileController extends GetxController {
  RxString selectedGender = 'male'.obs;
  RxBool activeBtn = false.obs;
  RxBool x = true.obs;
  RxBool y = true.obs;

  RxBool genderIndex = true.obs;
  RxBool gender = true.obs;
  RxInt type = 0.obs;
  RxInt stepperIndex = 0.obs;

  RxBool isBtnNull = false.obs;
  RxBool hidePassword = true.obs;

  var imageFile = ''.obs;
  var editedImage = ''.obs;

  var firstName = 'John'.obs;
  var lastName = 'Doe'.obs;

  var password = 'test123'.obs;

  /// Get from gallery

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

  //Fieldforms globalkeys
  Rx<Users?> userInfo = Users().obs;
  // Rx<CourseScore?> score = CourseScore().obs;
  CourseScore? scores;

  fetchScore() async {
    scores = await fetchUserScores(controller.userInfo.value!.id);
  }
  // Future<CourseScore?> scores = ;

  Rx<GlobalKey<FormFieldState>> emailFieldKey = GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> passFieldKey = GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> confirmFieldKey =
      GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> firstNameFieldKey =
      GlobalKey<FormFieldState>().obs;
  Rx<GlobalKey<FormFieldState>> lastNameFieldKey =
      GlobalKey<FormFieldState>().obs;
  //Textfield controllers
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  // late var scores;
  // @override
  // void onInit() {

  //   super.onInit();
  // }

}
