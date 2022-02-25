import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttons.dart';
import 'names.dart';
import 'variable.dart';

TimeController timeController = Get.put(TimeController());

class AdminList extends StatelessWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: adminNames
              .map((person) => NameButtons(
                  name: person,
                  delete: () {
                    timeController.updateTime();
                    timeController.greeting();
                    adminCheckout.add(person);
                    adminNames.remove(person);
                    person.checkin = timeController.time.toString();
                    Get.offNamed(
                        '/checkin?name=${person.name}&time=${person.checkin}&timeGreet=${timeController.timeGreet}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class StaffList extends StatelessWidget {
  const StaffList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: staffNames
              .map((person) => NameButtons(
                  name: person,
                  delete: () {
                    timeController.updateTime();
                    timeController.greeting();
                    staffCheckout.add(person);
                    staffNames.remove(person);
                    person.checkin = timeController.time.toString();
                    Get.offNamed(
                        '/checkin?name=${person.name}&time=${person.checkin}&timeGreet=${timeController.timeGreet}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: studentNames
              .map((person) => NameButtons(
                  name: person,
                  delete: () {
                    timeController.updateTime();
                    timeController.greeting();
                    studentCheckout.add(person);
                    studentNames.remove(person);
                    person.checkin = timeController.time.toString();
                    Get.offNamed(
                        '/checkin?name=${person.name}&time=${person.checkin}&timeGreet=${timeController.timeGreet}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}
