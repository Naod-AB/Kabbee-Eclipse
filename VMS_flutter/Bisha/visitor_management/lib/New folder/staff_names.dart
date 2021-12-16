// ignore_for_file: use_key_in_widget_constructors

import 'package:visitor_management/New%20folder/action_selection.dart';
import 'package:visitor_management/New%20folder/main.dart';
import 'buttons.dart';
import 'package:flutter/material.dart';

class StaffNameList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Expanded(
      child:Theme(
        data:Theme.of(context).copyWith(
          scrollbarTheme:  ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(Colors.blue[100]),
            crossAxisMargin: -10,
      ),
    ),
    child: Scrollbar( 
      thickness: 5.0,
      isAlwaysShown: true,
      child: 
     SingleChildScrollView (
       
       child: Column(children:  [
          Buttons(
                    btnName: "Staff", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)),
                Buttons(
                  btnName: "Abel", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Biniam", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Bana", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Christina", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Daniel", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                 Buttons(
                  btnName: "Feysel", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Genet", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "henos", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Isaias", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Ismael", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Jolly", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Kevin", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Luam", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Meron", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Melat", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Niat", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Natnael", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ),
                Buttons(
                  btnName: "Omiega", page: ActionPage(ActionSelection(),"PLEASE SELECT ONE OF THE FOLLOW OPTION",0.7)
                ), 
              ],
            ),
          ),
        ),
        ),
    );
  }
}
