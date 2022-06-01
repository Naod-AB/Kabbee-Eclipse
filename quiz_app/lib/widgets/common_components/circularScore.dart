import 'package:flutter/material.dart';

class CircularScore extends StatelessWidget {
  CircularScore({Key? key, this.scorePercent}) : super(key: key);

  dynamic scorePercent;

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
          ("${scorePercent.toString()}%"),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
