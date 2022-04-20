 import 'package:flutter/material.dart';

import '../../constants.dart';
import '../common_components/default_card.dart';
import '../front_end_choices/choose_langugae_screen.dart';
import 'component/appbar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:quez_app/constants.dart';
// import 'package:quez_app/screens/category_screen/component/appbar.dart';
// //import 'package:quez_app/screens/common_componens/default_card.dart'
// import 'package:quez_app/screens/common_components/default_card.dart';
// import 'package:quez_app/screens/front_end_choices/choose_langugae_screen.dart';
// //import 'package:quez_app/screens/front_end_choices/choose_langugae_screen.dart'dart';


class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: QuizeAppbar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              
              children: [  
                SizedBox(height: defaultPadding,),
                Text(
                  "Select Category",
                  style:Theme.of(context).primaryTextTheme.headline1),
                
                SizedBox(height: defaultPadding*3,),              
                ChoiceCard(
                  imgeSrc: "assets/icons/front end icons_small.svg",
                  cardtext: "Front-End",
                  onpressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  FrontEndChoices())
                                  );
                  },),
                SizedBox(height: defaultPadding*3,),
                ChoiceCard(
                  imgeSrc: "assets/icons/aws icons_small.svg",
                  cardtext: "Cloud-Service", 
                  onpressed: () {  },),
                SizedBox(height: defaultPadding*3,),
                ChoiceCard(
                  imgeSrc: "assets/icons/logos_nodejs-icon_small.svg", 
                  cardtext: "Back-End", 
                  onpressed: () {  },)
              ],
              
            ),
          ),
        )
      ),
    );
  }

  
}

