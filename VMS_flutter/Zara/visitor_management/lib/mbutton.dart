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
                    child: new Text(opti, style: TextStyle(fontSize: 17)), 
                    onPressed: () => {}, 
                    splashColor: Colors.blue.shade500,
    );
  }}  