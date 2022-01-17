import 'package:flutter/material.dart';
import 'package:visitor_management/buttons.dart';
import 'package:visitor_management/home.dart';
import 'package:visitor_management/name_list.dart';
import 'package:visitor_management/template.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Soption(
              'ADMIN',
              Template(Actionselector(), message, 50, 0.7),
            ),
            Soption('STAFF', Template(Actionselector(), message, 50, 0.7)),
            Soption('STUDENT', Template(Actionselector(), message, 50, 0.7)),
          ],
        ),
      ),
    );
  }
}

class Actionselector extends StatelessWidget {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String category = data['category'];
    print(category);

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Btn('CHECK IN', 350, 50, 13,
                Template(AdminList(), message, 40, 0.7), category),
            SizedBox(height: 35.0),
            Btn('CHECK OUT', 350, 50, 13,
                Template(AdminList(), message, 50, 0.7), category),
          ],
        ),
      ),
    );
  }
}
