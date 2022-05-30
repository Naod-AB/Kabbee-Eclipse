
import 'package:flutter/material.dart';

class CircularScore extends StatelessWidget {
  const CircularScore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
      border: Border.all(
       color: Colors.black, //                   <--- border color
        width: 1.0,
       ),
       borderRadius: BorderRadius.all(
          Radius.circular(50.0) //                 <--- border radius here
    ),

        ),

      //color: Colors.yellow,
      child: Center(
        child: Text(
          "10/10",
           textAlign: TextAlign.center,
           //style: TextStyle(fontSize: 5, color: Colors.white),
         style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white, fontSize: 20),  
        ),
      ),
    );
  }
}
