// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:visitor_management/New%20folder/action_selection.dart';
import 'package:visitor_management/New%20folder/checkout.dart';
import 'package:visitor_management/New%20folder/main.dart';

import 'buttons.dart';
import 'package:flutter/material.dart';
import 'staff_names.dart';

class NameList extends StatelessWidget {
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
                Buttons(
                    btnName: "Student", page: ActionPage(ActionSelection())),
                Buttons(
                  btnName: "Abel", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Biniam", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Bana", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Christina", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Daniel", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Feysel", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Genet", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "henos", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Isaias", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Ismael", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Jolly", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Kevin", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Luam", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Meron", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Melat", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Niat", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Natnael", page: ActionPage(ActionSelection())
                ),
                Buttons(
                  btnName: "Omiega", page: ActionPage(ActionSelection())
                ),
              ],
            ),
          ),
        ),
      ),

      //),
    );
  }
}
