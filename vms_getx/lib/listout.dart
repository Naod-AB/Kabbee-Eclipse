import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'name_list.dart';
import 'names.dart';
import 'buttons.dart';

class AdminOut extends StatelessWidget {
  const AdminOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: adminCheckout
              .map((name) => NameButtons(
                  name: name,
                  delete: () {
                    timeController.updateTime();
                    timeController.greeting();
                    adminCheckout.remove(name);
                    adminNames.add(name);
                    timeController.savedtime.value = name.checkin.toString();
                    Get.offNamed(
                        '/checkout?name=${name.name}&savedtime=${timeController.savedtime}&timeGreet=${timeController.timeGreet}&current=${timeController.time}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class StaffOut extends StatelessWidget {
  const StaffOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: staffCheckout
              .map((name) => NameButtons(
                  name: name,
                  delete: () {
                    timeController.updateTime();
                    timeController.greeting();
                    staffCheckout.remove(name);
                    staffNames.add(name);
                    timeController.savedtime.value = name.checkin.toString();
                    Get.offNamed(
                        '/checkout?name=${name.name}&savedtime=${timeController.savedtime}&timeGreet=${timeController.timeGreet}&current=${timeController.time}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class StudentOut extends StatelessWidget {
  const StudentOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: studentCheckout
              .map((name) => NameButtons(
                  name: name,
                  delete: () {
                    timeController.updateTime();
                    timeController.greeting();
                    studentCheckout.remove(name);
                    studentNames.add(name);

                    timeController.savedtime.value = name.checkin.toString();

                    Get.offNamed(
                        '/checkout?name=${name.name}&savedtime=${timeController.savedtime}&timeGreet=${timeController.timeGreet}&current=${timeController.time}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}
