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
    print('USERSLIST ${pController.userList}');
    pController.activeUsers.value = pController.userList!
        .where((element) => element["status"] == 'ACTIVE')
        .toList();
    print('ACTIVE >> ${pController.activeUsers}');
    print('ACTIVE >> ${pController.activeUsers.length}');
    print('');

    print('BLOCKED >> ${pController.blockedUsers}');
    print('BLOCKED >> ${pController.blockedUsers.length}');

    pController.activeUsersCount.value = pController.activeUsers.length;

    pController.blockedUsers.value = pController.userList!
        .where((element) => element["status"] == 'BLOCKED')
        .toList();
    pController.blockedUsersCount.value = pController.blockedUsers.length;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Users'),
            centerTitle: false,
            bottom: TabBar(
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              indicatorColor: kblue,
              labelColor: kblue,
              unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
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
          body: Obx(
            () => TabBarView(
              children: [
                activeList(),
                pController.blockedUsersCount.value == 0
                    ? ScoreAlertBox(
                        title: 'Users Not Found !',
                        text: 'All users are active')
                    : blockedList(),
              ],
            ),
          ),
        ));
  }

  Widget activeList() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Obx(() {
        return ListView.builder(
          itemCount: pController.activeUsersCount.value,
          itemBuilder: (context, index) {
            var user = pController.activeUsers[index];
            bool isUserAdmin =
                pController.activeUsers[index]['role'] == 'ADMIN';
            bool isCurrentUserAdmin =
                user['email'] == pController.userInfo.value!.email;
            return Card(
                color: Theme.of(context).shadowColor,
                child: buildUsersTiles(
                  context,
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
          itemCount: pController.blockedUsersCount.value,
          itemBuilder: (context, index) {
            var user = pController.blockedUsers[index];
            bool isUserAdmin =
                pController.blockedUsers[index]['role'] == 'ADMIN';
            bool isCurrentUserAdmin =
                user['email'] == pController.userInfo.value!.email;

            return Card(
                color: Theme.of(context).shadowColor,
                child: buildUsersTiles(
                    context,
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
