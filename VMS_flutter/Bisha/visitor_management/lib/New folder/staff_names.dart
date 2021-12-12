// ignore_for_file: use_key_in_widget_constructors

import 'package:visitor_management/New%20folder/main.dart';

import 'buttons.dart';
import 'package:flutter/material.dart';
import 'staff_names.dart';

class StaffNameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //   child: Theme(
        //     data: Theme.of(context).copyWith(
        //       scrollbarTheme: ScrollbarThemeData(
        //         thumbColor: MaterialStateProperty.all(Colors.blue[100]),
        //         crossAxisMargin: -10,
        //       ),
        //     ),
        //     child:
        Scrollbar(
          thickness: 5.0,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Buttons(
                  btnName: "Staff",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Abel",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Biniam",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Bana",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Christina",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Daniel",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Feysel",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Genet",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                /* Buttons(
                  btnName: "henos",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Isaias",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Ismael",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Jolly",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Kevin",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),
                Buttons(
                  btnName: "Luam",
                  btnColor: Colors.white,
                  txtColor: Colors.blueAccent,
                  width: 500,
                  height: 50,
                ),*/
              ],
            ),
          ),
        ),
        //),
        // ),
      ],
      //),
    );
  }
}
