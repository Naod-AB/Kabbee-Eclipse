import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'controllers/profile_bindings.dart';
import '../screens/profile_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: quizAppTheme().copyWith(
        brightness: Brightness.light,
      ),
      initialBinding: ProfileBinding(),
      home: ProfileScreen(),
    );
  }
}
