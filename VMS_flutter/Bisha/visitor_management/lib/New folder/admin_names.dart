// ignore_for_file: use_key_in_widget_constructors

import 'package:visitor_management/New%20folder/Student_names.dart';
import 'package:visitor_management/New%20folder/checkout.dart';
import 'package:visitor_management/New%20folder/main.dart';

import 'buttons.dart';
import 'package:flutter/material.dart';

import 'checkin.dart';
class AdminNameList extends StatelessWidget {

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
          Buttons(btnName:"Admin", page: ActionPage(Checkout())),
          Buttons(btnName:"Abel",),
          Buttons(btnName:"Biniam", ),
          Buttons(btnName:"Bana",),
          Buttons(btnName:"Christina",),
          Buttons(btnName:"Daniel", ),
          Buttons(btnName:"Feysel",),
          Buttons(btnName:"Genet",),
          Buttons(btnName:"henos",),
          Buttons(btnName:"Isaias",),
          Buttons(btnName:"Ismael",),
          Buttons(btnName:"Jolly",),
          Buttons(btnName:"Kevin",),
          Buttons(btnName:"Luam",),
           Buttons(btnName:"Meron",),
          Buttons(btnName:"Melat",),
          Buttons(btnName:"Niat",),
          Buttons(btnName:"Natnael",),
          Buttons(btnName:"Omiega",),

      ],
    ),
    ),
    ),
    ),


   
    );
    
  }
}