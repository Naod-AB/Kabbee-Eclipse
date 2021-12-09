// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  final Color txtColor;
  final double width;
  final double height;

  const Buttons({ this.btnName='',this.btnColor=Colors.white,this.txtColor=Colors.blueAccent,this.width=500,this.height=60}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
         ElevatedButton(child: Text(btnName),
         style:ElevatedButton.styleFrom(
          primary:btnColor,
          side: const BorderSide(width: 1,color: Colors.blueAccent),
          onPrimary: txtColor,
          minimumSize: Size(width,height),  
        ),
        onPressed: (){},
        ),
        const Padding(padding:EdgeInsets.all(15)),
        ]
    );
  }
}