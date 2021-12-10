import 'package:flutter/material.dart';

class MerryBtn extends StatelessWidget {
 // const MerryBtn({ Key? key }) : super(key: key);
final String option;
MerryBtn(this.option);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
                          onPressed:(){},
                          child: Text(option,
                          style: TextStyle(fontSize: 13.0),),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(400, 50),
                            side:BorderSide(width: 1,color: Colors.blue.shade400)),
                           );
  }
}