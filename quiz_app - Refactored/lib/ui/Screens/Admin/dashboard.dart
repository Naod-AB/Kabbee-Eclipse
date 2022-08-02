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
              const SizedBox(height: 25),
              buildDashBoardTiles(context, 'USERS', 32,
                  '0' + controller.usersLength.toString(), 64),
              const SizedBox(height: 20),
              buildDashBoardTiles(context, 'COURSES', 32,
                  '0' + controller.courseLength.length.toString(), 64),
              const SizedBox(height: 20),
              buildDashBoardTiles(context, 'CATEGORIES', 32,
                  '0' + controller.categoryLength.length.toString(), 64),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  pController.userList = await fetchUsers();

                  context.router.pushNamed('/users');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: buildTile(
                    Icons.group,
                    customText(context, 'Users', 18, true, false,
                        Theme.of(context).colorScheme.onBackground),
                    customText(context, 'See active and blocked', 13, false,
                        false, Theme.of(context).colorScheme.onBackground),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    true,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.router.pushNamed('/adminLanguages');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.tertiary),
                  child: buildTile(
                    Icons.view_list_outlined,
                    customText(context, 'Courses', 18, true, false,
                        Theme.of(context).colorScheme.onBackground),
                    customText(context, 'View and update courses', 13, false,
                        false, Theme.of(context).colorScheme.onBackground),
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
