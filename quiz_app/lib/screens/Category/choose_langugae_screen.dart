import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/courses.dart';
import '../../widgets/theme.dart';
import '../../widgets/common_components/appbar.dart';
import '../../widgets/common_components/default_card.dart';
import 'choose_type_screen.dart';


class FrontEndChoices extends StatelessWidget {
  const FrontEndChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: quizeAppbar(),
          body: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text("Select Language",
                  style: Theme.of(context).primaryTextTheme.headline1),
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding * 3),
                  itemCount: frontendCourses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ChoiceCard(
                        imgPosY: -100,
                        imgeSrc: frontendCourses[index].icon!,
                        cardtext: frontendCourses[index].courseName,
                        onpressed: () {
                          Get.to(const ChooseType(), arguments: [
                            frontendCourses[index].id,
                            frontendCourses[index].icon
                          ]);
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: defaultPadding * 3,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
