

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/service/api.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';

class AuthController extends GetxController{
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  List<Users> allusers = [];
  RxBool obsecure = true.obs;
  RxBool rememberMe = false.obs;
  RxString error = "".obs;
  RxInt signUpIndex = 0.obs;
   
 @override
 void onInit()async {
   allusers = await fetchAllUsers();
    
 }
}