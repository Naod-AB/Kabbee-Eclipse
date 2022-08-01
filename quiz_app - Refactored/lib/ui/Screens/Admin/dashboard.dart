// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';

import '../../../service/services.dart';

class DashboardPage extends GetView<ProfileController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 25),
              buildDashBoardTiles(context, 'USERS', 32,
                  '0' + pController.usersLength.toString(), 64),
              SizedBox(height: 20),
              buildDashBoardTiles(context, 'COURSES', 32,
                  '0' + pController.courseLength.length.toString(), 64),
              SizedBox(height: 20),
              buildDashBoardTiles(context, 'CATEGORIES', 32,
                  '0' + pController.categoryLength.length.toString(), 64),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  pController.userList = await fetchUsers();

                  context.router.pushNamed('/users');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).shadowColor,
                  ),
                  child: buildTile(
                    Icons.group,
                    customText(context, 'Users', 18, true, false, primaryColor),
                    customText(context, 'See active and blocked', 13, false,
                        false, secondaryColor),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.router.pushNamed('/adminLanguages');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).shadowColor),
                  child: buildTile(
                    Icons.view_list_outlined,
                    customText(
                        context, 'Courses', 18, true, false, primaryColor),
                    customText(context, 'View and update courses', 13, false,
                        false, secondaryColor),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
