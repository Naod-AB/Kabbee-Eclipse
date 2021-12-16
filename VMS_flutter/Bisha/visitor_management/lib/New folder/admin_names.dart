// ignore_for_file: use_key_in_widget_constructors

import 'package:visitor_management/New%20folder/action_selection.dart';
import 'package:visitor_management/New%20folder/main.dart';
import 'buttons.dart';
import 'package:flutter/material.dart';

class AdminNameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(Colors.blue[100]),
            crossAxisMargin: -10,
          ),
        ),
        child: Scrollbar(
          thickness: 5.0,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Buttons(btnName: "Administrator", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)),
                Buttons(btnName: "Abel", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)),
                Buttons(btnName: "Biniam", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)),
                Buttons(btnName: "Bana", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)),
                Buttons(btnName: "Christina", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
