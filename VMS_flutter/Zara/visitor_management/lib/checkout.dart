// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_management/hanibuttons.dart';

void main() => runApp(MaterialApp(
      home: checkout(),
    ));

class checkout extends StatelessWidget {
  const checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blueAccent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text(
              'KABBEE',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              indent: 410.0,
              endIndent: 410.0,
              height: 5.0,
              color: Colors.blue.shade300,
            ),
            SizedBox(height: 120.0),
            Text(
              'YOU ARE CHECKED IN AT',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue.shade400,
              ),
            ),
            HaniTime('7:45 AM'),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'YOU ARE CHECKED OUT AT',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue.shade400,
              ),
            ),
            HaniTime('6:00 PM'),
            SizedBox(
              height: 50,
            ),
            Text(
              'HAVE A GOOD EVENING',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blue.shade400,
              ),
            ),
            Text(
              'SEE YOU TOMORROW',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blue.shade400,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            HaniBtn(),
          ],
        ),
      ),
    );
  }
}
