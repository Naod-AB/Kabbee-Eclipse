import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'controllers/profile_bindings.dart';

import 'routes/router.gr.dart';

import 'widgets/theme.dart';

void main() {
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
