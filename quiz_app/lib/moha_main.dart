import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/category_screen/category_screen.dart';
import 'theme.dart';
//import 'package:quez_app/constants.dart';
//import 'package:quez_app/screens/Category_screen/select_category.dart';
//import 'package:quez_app/screens/category_screen/category_screen.dart';
//import 'package:quez_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QuezApp',
      theme: quizAppTheme(),
      debugShowCheckedModeBanner: false,

      home:const CategoryPage()// will be replace by initial route once the routes are set 

    );
  }
}

  
