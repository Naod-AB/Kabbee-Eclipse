import 'package:flutter/material.dart';
import 'main.dart';
import './selection.dart';
import './template.dart';
import 'names.dart';

//Option selection Button Kidane's Code
class OptionSelectionBtn extends StatelessWidget {
  final String category;

  const OptionSelectionBtn(this.category, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Template(Actionselector(category), message, y, z),
              ));
        },
        height: 55.0,
        minWidth: 260.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(
          category,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}

//Name List Esrom's Code
class NameListBtn extends StatelessWidget {
  final String sss;
  final dynamic page;
  const NameListBtn(this.sss, this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(sss),
      style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 15),
          fixedSize: const Size(300, 35),
          side: const BorderSide(width: 1, color: Colors.blue)),
    );
  }
}

//Hani and Merry's Code
class CheckInOutBtns extends StatelessWidget {
  final String sss;
  final dynamic args;
  final String action;

  const CheckInOutBtns(this.sss, this.args, this.action, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    path = args.toString().toLowerCase(); //admin (string)
    path = path + action;

    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/$path', arguments: {
          // '/admin'
          'category': args, // admin
          'selected': action, // in or out
        });
      },
      child: Text(sss),
      style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 13),
          fixedSize: const Size(350, 50),
          side: const BorderSide(width: 1, color: Colors.blue)),
    );
  }
}

//Code for check in and out time Hani's Code
class CheckTimeboxes extends StatelessWidget {
  final String time;
  const CheckTimeboxes(this.time, {Key? key}) : super(key: key);
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
          time,
          style: TextStyle(
            fontSize: 20.0,
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
          style: const TextStyle(
            fontSize: 28.0,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          widget.delete();
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.white),
          onPrimary: Colors.white,
          minimumSize: const Size(500, 50),
        ),
      ),
    );
  }
}
