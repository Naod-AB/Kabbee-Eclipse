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
              blockedList(),
            ],
          )),
    );
  }

  Widget activeList() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          var user = controller.userList![index];
          bool isAdmin =
              user['firstName'] == controller.userInfo.value!.firstName;

          return Card(
              color: Colors.white12,
              child: buildUsersTiles(
                Image.asset('assets/images/avatar.png'),
                user['firstName'].toString().toCapitalized() +
                    ' ' +
                    user['lastName'].toString().toCapitalized(),
                user['email'],
                null,
                false,
                isAdmin,
              ));
        },
      ),
    );
  }

  Widget blockedList() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          var user = controller.userList![3];

          return Card(
              color: Colors.white12,
              child: buildUsersTiles(
                  Image.asset('assets/images/avatar.png'),
                  user['firstName'].toString().toCapitalized() +
                      ' ' +
                      user['lastName'].toString().toCapitalized(),
                  user['email'],
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                  false,
                  false));
        },
      ),
    );
  }
}
