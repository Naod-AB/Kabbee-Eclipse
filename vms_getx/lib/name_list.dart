// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttons.dart';
import 'names.dart';
import 'variable.dart';

TimeController timeController = Get.put(TimeController());

class AdminList extends StatefulWidget {
  @override
  State<AdminList> createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                //this is added inorder to change the error
                adminNames
                    .map((name) => NameButtons(
                        myname: name,
                        delete: () {
                          setState(() {
                            timeController.updateCheckin();
                            timeController.greet();
                            adminNames.remove(name);
                            // print('object2');
                            adminCheckout.add(name);
                            name.checkin = timeController.time.toString();
                          });

                          Get.toNamed(
                              '/checkin?name=${name.name}&time=${name.checkin}&timeGreet=${timeController.timeGreet}');
                        }))
                    .toList()),
      ),
    );
  }
}

class StaffList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
              //this is added inorder to change the error
              staffNames
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        timeController.updateCheckin();
                        timeController.greet();
                        staffCheckout.add(name);
                        staffNames.remove(name);
                        name.checkin = timeController.time.toString();
                        Get.toNamed(
                            '/checkin?name=${name.name}&time=${name.checkin}&timeGreet=${timeController.timeGreet}');
                      }))
                  .toList(),
        ),
      ),
    );
  }
}

var nameList = NameList().obs;

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: studentNames.isEmpty
              ? [alert()]
              :
              //this is added inorder to change the error
              studentNames
                  .map((name) => NameButtons(
                      myname: name,
                      delete: () {
                        timeController.updateCheckin();
                        timeController.greet();
                        studentCheckout.add(name);
                        studentNames.remove(name);
                        name.checkin = timeController.time.toString();
                        Get.toNamed(
                            '/checkin?name=${name.name}&time=${name.checkin}&timeGreet=${timeController.timeGreet}');
                      }))
                  .toList(),
        ),
      ),
    );
  }
}

alert() {
  print('nobody here');
  Get.defaultDialog(
    radius: 3,
    actions: [
      TextButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      )
    ],
  );
}

// stateful code for refrence
// one stateful class 👇
// class StudentList extends StatefulWidget {
//   const StudentList({Key? key}) : super(key: key);
//   @override
//   State<StudentList> createState() => _StudentListState();
// }
// class _StudentListState extends State<StudentList> {
//   @override
//   void initState() {
//     isDay = true;
//     greet();
//     super.initState();
//     timeGreet;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
// child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children:
//       //this is added inorder to change the error
//       studentNames.isEmpty
//           ? [
//               Text(
//                 'No Users Found ',
//                 style: TextStyle(fontSize: 24, color: Colors.blue),
//                 textAlign: TextAlign.center,
//               )
//             ]
//           : studentNames
//               .map((name) => NameButtons(
//                   myname: name,
//                   delete: () {
//                     setState(() {
//                       updateCheckin();
//                       name.checkin = time;
//                       studentCheckout.add(name);
//                       studentNames.remove(name);

// Get.toNamed('/checkin?name=${name.name}&time=$time&timeGreet=$timeGreet')
//
//
//
//                     });
//                   }))
//               .toList(),
// ),
//       ),
//     );
//   }
// }
