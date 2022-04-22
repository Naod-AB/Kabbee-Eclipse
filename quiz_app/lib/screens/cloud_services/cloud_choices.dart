import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quez_app/Models/courses.dart';
// import 'package:quez_app/constants.dart';
// import 'package:get/get.dart';
// import 'package:quez_app/screens/choose_type/choose_type_screen.dart';
// import 'package:quez_app/screens/front_end_choices/component/appbar.dart';

import '../../constants.dart';
import '../choose_type/choose_type_screen.dart';
import '../common_components/default_card.dart';
// import 'components/appbar.dart';
import '../common_components/appbar.dart';
import '../../Models/courses.dart';

class CloudChoices extends StatelessWidget {
  const CloudChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: QuizeAppbar(),
          body: Column(
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              Text("Select Language",
                  style: Theme.of(context).primaryTextTheme.headline1),
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding * 3),
                  itemCount: cloudCourse.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ChoiceCard(
                        imgPosY: -110,
                        imgeSrc: cloudCourse[index].icon!,
                        cardtext: cloudCourse[index].courseName,
                        onpressed: () {
                          Get.to(ChooseType(), arguments: [
                            cloudCourse[index].id,
                            cloudCourse[index].icon
                          ]);
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: defaultPadding * 3,
                    );
                  },
                ),
                // child: Column(
                // children: [
                //   SizedBox(height: defaultPadding,),
                //   Text("Select Language",style: Theme.of(context).primaryTextTheme.headline1),

                //   SizedBox(height: defaultPadding*3,),
                //   ChoiceCard(
                //     imgeSrc: "assets/icons/html.svg",
                //     cardtext: "HTML",
                //     onpressed: () {  },),
                //   SizedBox(height: defaultPadding*3,),
                //   ChoiceCard(
                //     imgeSrc: "assets/icons/dart.svg",
                //     cardtext: "Dart",
                //     onpressed: () {  },),
                //   SizedBox(height: defaultPadding*3,),
                //   ChoiceCard(
                //     imgeSrc: "assets/icons/flutter.svg",
                //     cardtext: "Flutter",
                //     onpressed: () {  },)
                // ],

                // ),
              ),
            ],
          )),
    );
  }
}
