import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/user_profile_widget.dart';

class ProfileController extends GetxController {
  RxString selectedGender = 'male'.obs;
  RxBool activeBtn = false.obs;

  RxBool genderIndex = true.obs;
  RxBool gender = true.obs;
  RxInt type = 0.obs;

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
      showSnackbar(context, 'Image', 'chosen', 'success');

      isBtnNull.value = true;
    } else {
      showSnackbar(context, 'Image', 'error', 'error');
    }
  }

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
}
