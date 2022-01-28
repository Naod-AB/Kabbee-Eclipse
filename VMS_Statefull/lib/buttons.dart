import 'package:flutter/material.dart';
import 'main.dart';
import './selection.dart';
import './template.dart';
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Template(Actionselector(userRole),
                    subheadertxt, width2, widthfactor),
              ));
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
  final dynamic args;
  final String action;

  const CheckInOutBtns(this.checkBtnName, this.args, this.action, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    path = args.toString().toLowerCase(); //admin (string)
    path = path + action;

    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/$path', arguments: {
          'category': args, // admin
          'selected': action, // in or out
        });
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

class NameButtons extends StatefulWidget {
  final NameList myname;
  final Function delete;
  const NameButtons({Key? key, required this.myname, required this.delete})
      : super(key: key);

  @override
  State<NameButtons> createState() => _NameButtonsState();
}

//moving names and deleting them
class _NameButtonsState extends State<NameButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          widget.myname.name.toString(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade400,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          widget.delete();
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
