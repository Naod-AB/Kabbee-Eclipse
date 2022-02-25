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
        title: 'CHECKING OUT?',
        titleStyle: TextStyle(color: Colors.blue),
        titlePadding: const EdgeInsetsDirectional.all(20),
        content: SizedBox(
            width: 250,
            child: Text(
              'ALL ${userRole.toString().toUpperCase()}S HAVE ALREADY CHECKED OUT',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            )),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        actions: [
          OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OKAY '))
        ],
      );
    }

    var pathChecker = path.toString().substring(path.length - 3);

    inEmptyDialog() {
      Get.defaultDialog(
        title: pathChecker.contains('out') ? 'CHECKING OUT?' : 'CHECKING IN?',
        titleStyle: TextStyle(color: Colors.blue),
        titlePadding: EdgeInsetsDirectional.all(20),
        content: SizedBox(
            width: 250,
            child: Text(
              pathChecker.contains('out')
                  ? 'ALL ${userRole.toString().toUpperCase()}S HAVE ALREADY CHECKED OUT'
                  : 'ALL ${userRole.toString().toUpperCase()}S HAVE ALREADY CHECKED IN',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            )),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        actions: [
          OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OKAY '))
        ],
      );
    }

    return OutlinedButton(
      onPressed: () {
        if (adminNames.isEmpty && path.toString() == 'adminin' ||
            adminCheckout.isEmpty && path.toString() == 'adminout') {
          inEmptyDialog();
        } else if (staffNames.isEmpty && path.toString() == 'staffin' ||
            staffCheckout.isEmpty && path.toString() == 'staffout') {
          inEmptyDialog();
        } else if (studentNames.isEmpty && path.toString() == 'studentin' ||
            studentCheckout.isEmpty && path.toString() == 'studentout') {
          inEmptyDialog();
        } else {
          Get.toNamed('/$path');
        }
      },
      child: Text(checkBtnName, style: const TextStyle(color: Colors.blue)),
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

class DoneBtn extends StatelessWidget {
  double top;
  DoneBtn(this.top, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, top, 0, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Colors.white,
            side: const BorderSide(width: 1, color: Colors.blue),
            onPrimary: Colors.white,
            minimumSize: const Size(200.0, 55.0),
          ),
          onPressed: () {
            Get.toNamed('/selection');
          },
          child: Text(
            'DONE',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue.shade400,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }
}

class NameButtons extends StatelessWidget {
  // NameButtons();

  final NameList name;
  final Function delete;
  const NameButtons({Key? key, required this.name, required this.delete})
      : super(key: key);
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          name.name.toString(),
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
