

import 'package:flutter/material.dart';

import '../../../constants.dart';
//import 'package:quez_app/constants.dart';

AppBar QuizeAppbar() {
    return AppBar(
        backgroundColor: appbarColor,
        // leading:  Padding(
        //   padding: const EdgeInsets.only(left: defaultPadding),
        //   child: IconButton(
        //     icon:Icon(Icons.arrow_back), 
        //     onPressed: () {  },),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding/2),
            child: CircleAvatar(
                foregroundImage:AssetImage("assets/images/profile_pic_demo.jpg"),
              
            ),
          )
        ],
      );
  }