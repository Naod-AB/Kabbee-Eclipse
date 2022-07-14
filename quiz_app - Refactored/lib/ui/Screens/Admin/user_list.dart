import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/string_extension.dart';

import '../../common_widgets/score_alert_box.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('USERSLIST ${controller.userList}');
    controller.activeUsers.value = controller.userList!
        .where((element) => element["status"] == 'ACTIVE')
        .toList();
    print('ACTIVE >> ${controller.activeUsers}');
    print('ACTIVE >> ${controller.activeUsers.length}');
    print('');

    print('BLOCKED >> ${controller.blockedUsers}');
    print('BLOCKED >> ${controller.blockedUsers.length}');

    controller.activeUsersCount.value = controller.activeUsers.length;

    controller.blockedUsers.value = controller.userList!
        .where((element) => element["status"] == 'BLOCKED')
        .toList();
    controller.blockedUsersCount.value = controller.blockedUsers.length;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Users'),
            centerTitle: false,
            bottom: const TabBar(
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              indicatorColor: kblue,
              tabs: [
                Tab(
                  text: 'ACTIVE',
                ),
                Tab(
                  text: 'BLOCKED',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              activeList(),
              controller.blockedUsersCount.value == 0
                  ? ScoreAlertBox(
                      title: 'Users Not Found !', text: 'All users are active')
                  : blockedList(),
            ],
          ),
        ));
  }

  Widget activeList() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Obx(() {
        return ListView.builder(
          itemCount: controller.activeUsersCount.value,
          itemBuilder: (context, index) {
            var user = controller.activeUsers[index];
            bool isUserAdmin = controller.activeUsers[index]['role'] == 'ADMIN';
            bool isCurrentUserAdmin =
                user['email'] == controller.userInfo.value!.email;
            return Card(
                color: Colors.white12,
                child: buildUsersTiles(
                  Image.asset('assets/images/avatar.png'),
                  user['firstName'].toString().toCapitalized() +
                      ' ' +
                      user['lastName'].toString().toCapitalized(),
                  user['email'],
                  isCurrentUserAdmin,
                  true,
                  isUserAdmin,
                  user,
                  index,
                ));
          },
        );
      }),
    );
  }

  Widget blockedList() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Obx(() {
        return ListView.builder(
          itemCount: controller.blockedUsersCount.value,
          itemBuilder: (context, index) {
            var user = controller.blockedUsers[index];
            bool isUserAdmin =
                controller.blockedUsers[index]['role'] == 'ADMIN';
            bool isCurrentUserAdmin =
                user['email'] == controller.userInfo.value!.email;

            return Card(
                color: Colors.white12,
                child: buildUsersTiles(
                    Image.asset('assets/images/avatar.png'),
                    user['firstName'].toString().toCapitalized() +
                        ' ' +
                        user['lastName'].toString().toCapitalized(),
                    user['email'],
                    isCurrentUserAdmin,
                    false,
                    isUserAdmin,
                    user,
                    index));
          },
        );
      }),
    );
  }
}
