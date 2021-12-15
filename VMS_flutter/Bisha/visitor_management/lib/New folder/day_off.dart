
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:visitor_management/New%20folder/main.dart';


class dayoff extends StatelessWidget {
  const dayoff({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return 
           Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
                Text("PLEASE SELECT YOUR DAY OFF",
                style: TextStyle( color: Colors.blue[600],
                wordSpacing: 5.0,
                fontSize: 20.0,),),
                  DatePickerDialog(
                    initialDate: DateTime(2021, 12, 1),
                    firstDate: DateTime(2021, 12, 1),
                    lastDate: DateTime(2092, 1, 1),
                  )
                ]);
  }
}