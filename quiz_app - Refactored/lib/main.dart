import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_bindings.dart';
import 'package:quiz_app/ui/utils/theme.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'routes/router.gr.dart';

void main() async {
  await Hive.initFlutter();
  // ProfileBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Quiz APP',
      smartManagement: SmartManagement.keepFactory,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: quizAppTheme().copyWith(
        brightness: Brightness.light,
      ),
      initialBinding: ProfileBinding(),
      debugShowMaterialGrid: false,
    );
  }
}
