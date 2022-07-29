import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_bindings.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';

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
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp.router(
        title: 'Quiz APP',
        smartManagement: SmartManagement.keepFactory,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: Themes.lightMode,
        darkTheme: Themes.darkMode,
        themeMode:
            controller.isDarkMode.value ? ThemeMode.light : ThemeMode.light,
        initialBinding: ProfileBinding(),
        debugShowMaterialGrid: false,
      ),
    );
  }
}
