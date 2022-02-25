// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'names.dart';

//Option selection Buttons
class OptionSelectionBtn extends StatelessWidget {
  final String userRole;

  const OptionSelectionBtn(this.userRole, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: MaterialButton(
        onPressed: () {
          Get.toNamed('/actionSelection?role=$userRole');
        },
        height: 60.0,
        minWidth: 300.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(
          userRole,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}

//check in and out Buttons on Action selection
class CheckInOutBtns extends StatelessWidget {
  final String checkBtnName;
  final dynamic userRole;
  final String action;

  const CheckInOutBtns(this.checkBtnName, this.userRole, this.action,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    path = userRole.toString().toLowerCase(); //admin (string)
    path = path + action;

    emptyDialog() {
      Get.defaultDialog(
        title: 'Checking Out?',
        titlePadding: EdgeInsetsDirectional.all(20),
        content: SizedBox(
            width: 250,
            child: Text(
              'Currently, there are no users checked in as ${userRole.toString().toLowerCase()}',
              textAlign: TextAlign.center,
            )),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        // confirm: Padding(
        //   padding: EdgeInsets.all(20),
        //   child: CheckInOutBtns('CHECK IN', userRole, "in"),
        // ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('back '))
        ],
      );
    }

    inEmptyDialog() {
      Get.defaultDialog(
        title: 'Checking In?',
        titlePadding: EdgeInsetsDirectional.all(20),
        content: SizedBox(
            width: 250,
            child: Text(
              'Currently,all users have been checked in.',
              textAlign: TextAlign.center,
            )),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        // confirm: Padding(
        //   padding: EdgeInsets.all(20),
        //   child: CheckInOutBtns('CHECK IN', userRole, "in"),
        // ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('back '))
        ],
      );
    }

    return OutlinedButton(
      onPressed: () {
        // Get.toNamed('/$path');

        //
        // if (adminNames.isEmpty && path.toString() == 'adminin') {
        //   inEmptyDialog();
        // } else if (staffNames.isEmpty && path.toString() == 'staffin') {
        //   inEmptyDialog();
        // } else if (studentNames.isEmpty && path.toString() == 'studentin') {
        //   inEmptyDialog();
        // } else {
        //   Get.toNamed('/$path');
        // }

        if (adminCheckout.isEmpty && path.toString() == 'adminout') {
          emptyDialog();
        } else if (staffCheckout.isEmpty && path.toString() == 'staffout') {
          emptyDialog();
        } else if (studentCheckout.isEmpty && path.toString() == 'studentout') {
          emptyDialog();
        } else {
          Get.toNamed('/$path');
        }
      },
      child: Text(checkBtnName, style: TextStyle(color: Colors.blue)),
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          fixedSize: const Size(350, 50),
          side: const BorderSide(width: 1, color: Colors.blue)),
    );
  }
}

//boxes that show time on checkin and checkout
class CheckTimeboxes extends StatelessWidget {
  final String timeTxt;
  const CheckTimeboxes(this.timeTxt, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Center(
        child: Text(
          timeTxt,
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.blue.shade500,
          ),
        ),
      ),
    );
  }
}

class NameButtons extends StatelessWidget {
  // NameButtons();

  final NameList myname;
  final Function delete;
  NameButtons({required this.myname, required this.delete});
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          myname.name.toString(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade400,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          delete();
          //print('object');
        },
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: Colors.white,
          side: const BorderSide(width: 1, color: Colors.blue),
          onPrimary: Colors.white,
          minimumSize: const Size(300.0, 55.0),
        ),
      ),
    );
  }
}
