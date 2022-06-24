import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/users.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/pallete.dart';
import 'package:quiz_app/ui/utils/string_extension.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List activeUsers = controller.userList!
        .where((element) => element["status"] == 'active')
        .toList();
    List blockedUsers = controller.userList!
        .where((element) => element["status"] == 'blocked')
        .toList();

    // print(
    //     'USERS >  ${controller.userList?.map((user) => user["status"] == 'blocked')}');
    print(
        'USERS >  ${controller.userList!.where((element) => element["status"] == 'blocked')}');
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
              activeList(activeUsers),
              blockedList(blockedUsers),
            ],
          )),
    );
  }

  Widget activeList(List activeUsers) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: activeUsers.length,
        itemBuilder: (context, index) {
          var user = activeUsers[index];

          bool isUserAdmin = activeUsers[index]['role'] == 'admin';

          bool isCurrentUserAdmin =
              user['firstName'] == controller.userInfo.value!.firstName;

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
              ));
        },
      ),
    );
  }

  Widget blockedList(List blockedUsers) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: blockedUsers.length,
        itemBuilder: (context, index) {
          var user = blockedUsers[index];
          bool isUserAdmin = blockedUsers[index]['role'] == 'admin';
          bool isCurrentUserAdmin =
              user['firstName'] == controller.userInfo.value!.firstName;

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
                  isUserAdmin));
        },
      ),
    );
  }
}
