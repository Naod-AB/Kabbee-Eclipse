// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'name_list.dart';
import 'names.dart';
import 'buttons.dart';

class AdminOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: adminCheckout
              .map((name) => NameButtons(
                  myname: name,
                  delete: () {
                    timeController.updateCheckOut();
                    timeController.greet();
                    adminCheckout.remove(name);
                    adminNames.add(name);

                    timeController.savedtime.value = name.checkin.toString();

                    Get.toNamed(
                        '/checkout?name=${name.name}&savedtime=${timeController.savedtime}&timeGreet=${timeController.timeGreet}&current=${timeController.current}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class StaffOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: staffCheckout
              .map((name) => NameButtons(
                  myname: name,
                  delete: () {
                    timeController.updateCheckOut();
                    timeController.greet();
                    staffCheckout.remove(name);
                    staffNames.add(name);

                    timeController.savedtime.value = name.checkin.toString();

                    Get.toNamed(
                        '/checkout?name=${name.name}&savedtime=${timeController.savedtime}&timeGreet=${timeController.timeGreet}&current=${timeController.current}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class StudentOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: studentCheckout
              .map((name) => NameButtons(
                  myname: name,
                  delete: () {
                    timeController.updateCheckOut();
                    timeController.greet();
                    studentCheckout.remove(name);
                    studentNames.add(name);

                    timeController.savedtime.value = name.checkin.toString();

                    Get.toNamed(
                        '/checkout?name=${name.name}&savedtime=${timeController.savedtime}&timeGreet=${timeController.timeGreet}&current=${timeController.current}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}
