
import 'package:flutter/material.dart';
import 'package:visitor_management/merrybtn.dart';

// ignore: prefer_const_constructors
void main() =>runApp(MaterialApp(
  home: Actionselector(),
));

class Actionselector extends StatelessWidget {
  const Actionselector({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0,color: Colors.blueAccent,)
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    'KABBEE',
                     style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                     ),
                  ),
                  FractionallySizedBox(
                    widthFactor:0.7,
                    child: Divider(
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 35.0),
                  Text(
                    'PLEASE SELECT ONE OF THE FOLLOW OPTION',
                     style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15.0,
                     ),
                  ),
                  SizedBox(height:35.0),
                  Container(
                    child: InkWell(
                      child: Column(
                        children: [
                          MerryBtn('CHECK IN',),
                             SizedBox(height: 35.0),
                          MerryBtn('CHECK OUT'),
                             SizedBox(height: 35.0),
                          MerryBtn('REQUEST DAY OFF'),
                             SizedBox(height: 35.0),
                          MerryBtn('OTHER'),
                        ],
                        ),
                    ),
                  ),
                ],),
            ),
      ),
    );
  }
}

