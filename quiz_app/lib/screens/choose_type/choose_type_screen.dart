import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quez_app/Models/courses.dart';
// import 'package:quez_app/constants.dart';
// import 'package:get/get.dart';
// import 'package:quez_app/screens/common_components/default_card.dart';

import '../../constants.dart';
import '../common_components/default_card.dart';
import 'components/appbar.dart';

class ChooseType extends StatelessWidget {
  const ChooseType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: QuizeAppbar(Get.arguments[1]),
        body: Column(
          children: [
            SizedBox(height: defaultPadding,),
            Text("Select Type ",style: Theme.of(context).primaryTextTheme.headline1),
            Expanded(
              
                child: ListView(
                     children: [                    
                    SizedBox(height: defaultPadding*3,),              
                    ChoiceCard(
                      imgeSrc: "assets/icons/Practice_test.svg",
                      cardtext: "Practice Test", 
                      onpressed: () {  },),
                    SizedBox(height: defaultPadding*3,),
                    ChoiceCard(
                      imgeSrc: "assets/icons/final_text.svg", 
                      cardtext: "Evalution Exam", 
                      onpressed: () {  },),
                    SizedBox(height: defaultPadding*3,),
                                      ],
                )
             ),
          ],
        )
      ),
    );
           
  }
}