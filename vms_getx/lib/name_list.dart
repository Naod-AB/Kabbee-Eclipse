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
          children: staffNames
              .map((name) => NameButtons(
                  myname: name,
                  delete: () {
                    timeController.updateTime();
                    timeController.greet();
                    adminCheckout.add(name);
                    adminNames.remove(name);
                    name.checkin = timeController.time.toString();
                    Get.offNamed(
                        '/checkin?name=${name.name}&time=${name.checkin}&timeGreet=${timeController.timeGreet}');
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
              .map((name) => NameButtons(
                  myname: name,
                  delete: () {
                    timeController.updateTime();
                    timeController.greet();
                    staffCheckout.add(name);
                    staffNames.remove(name);
                    name.checkin = timeController.time.toString();
                    Get.offNamed(
                        '/checkin?name=${name.name}&time=${name.checkin}&timeGreet=${timeController.timeGreet}');
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
              .map((name) => NameButtons(
                  myname: name,
                  delete: () {
                    timeController.updateTime();
                    timeController.greet();
                    studentCheckout.add(name);
                    studentNames.remove(name);
                    name.checkin = timeController.time.toString();
                    Get.offNamed(
                        '/checkin?name=${name.name}&time=${name.checkin}&timeGreet=${timeController.timeGreet}');
                  }))
              .toList(),
        ),
      ),
    );
  }
}
