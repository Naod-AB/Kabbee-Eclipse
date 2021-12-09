// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/nbutton.dart';

class AdminList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 1240,
            height: 580,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blue, width: 1, style: BorderStyle.solid),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: Text('KABBEE',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Divider(
                    indent: 150.0,
                    endIndent: 150.0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'PLEASE SELECT YOUR NAME',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Nbtn('Admin list'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('ARKAN'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('MARTHA'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('YEMANE'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('EVEN'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('SAMUEL'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('FITSUM'),
                          SizedBox(height: 15.0),
                          Nbtn('SAMUEL'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('AHLEM'),
                          SizedBox(height: 15.0),
                          Nbtn('SEGEN'),
                          SizedBox(
                            height: 15.0,
                          ),
                          Nbtn('RODAS')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
