 // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

 import 'package:flutter/material.dart';
class Soption extends StatelessWidget {
  //const Soption({ Key? key }) : super(key: key);
final String opti;
Soption(this.opti);
  @override
  Widget build(BuildContext context) {
    return MaterialButton( 
                    height: 55.0, 
                    minWidth: 260.0, 
                      color: Theme.of(context).primaryColor, 
                    textColor: Colors.white,  
                    child: Text(opti, style: TextStyle(fontSize: 17)), 
                    onPressed: () => {}, 
                    splashColor: Colors.blue.shade500,
    );
  }}  