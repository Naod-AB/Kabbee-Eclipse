// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  final Color txtColor;
  final double width;
  final double height;
  final double fontSize;
  dynamic page;

  Buttons({Key? key, 
    this.btnName = '',
    this.btnColor = Colors.white,
    this.txtColor = Colors.blueAccent,
    this.width = 500,
    this.height = 50,
    this.fontSize = 20,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: Text(
          btnName,
          style: TextStyle(fontSize: fontSize),
        ),
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          side: const BorderSide(width: 1, color: Colors.blueAccent),
          onPrimary: txtColor,
          minimumSize: Size(width, height),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
      const Padding(padding: EdgeInsets.all(15)),
    ]);
  }
}

class BlueButtons extends StatelessWidget {
  final String btnName;
  dynamic page;

  BlueButtons({Key? key, 
    this.btnName = '',
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: Text(
          btnName,
          style:const TextStyle(fontSize: 20.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          side: const BorderSide(width: 1, color: Colors.blueAccent),
          onPrimary: Colors.white,
          minimumSize:const Size(420.0, 70.0),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
      const Padding(padding: EdgeInsets.all(15)),
    ]);
  }
}

class ActionButtons extends StatelessWidget {
  final String btnName;
  final double width;
  dynamic page;

  ActionButtons({Key? key, 
    this.btnName = '',
    this.width = 420.0,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: Text(
          btnName,
          style:const TextStyle(fontSize: 20.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          side: const BorderSide(width: 1, color: Colors.blueAccent),
          onPrimary: Colors.blue,
          minimumSize: Size(width, 70.0),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
      const Padding(padding: EdgeInsets.all(15)),
    ]);
  }
}

class ContainersButton extends StatelessWidget {
  final String txt;
  const ContainersButton(this.txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 420.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade500,
          ),
        ),
      ),
    );
  }
}
