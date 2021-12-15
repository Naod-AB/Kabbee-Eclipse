// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/startingpage.dart';
import 'option_selection.dart';

 //void main() {
  // runApp(MaterialApp(
    // debugShowCheckedModeBanner: false, home: ActionPage(OptionSelect())));
//}

class ActionPage extends StatelessWidget {
  dynamic specificPage = OptionSelect();
  ActionPage(dynamic inputPage) {
    specificPage = inputPage;
  }
  @override
  Widget build(BuildContext context) {
    //using material instead of scaffold
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartingPage()))
                  },
                  child: Text(
                    'KABBEE',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Text(
                  'PLEASE SELECT YOUR NAME',
                  style: TextStyle(
                      color: Colors.blue[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 80)),
                specificPage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
