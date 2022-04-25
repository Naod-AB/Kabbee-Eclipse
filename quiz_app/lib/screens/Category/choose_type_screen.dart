import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/theme.dart';
import '../../widgets/common_components/appbar.dart';
import '../../widgets/common_components/default_card.dart';

class ChooseType extends StatelessWidget {
  const ChooseType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: quizeAppbar2(Get.arguments[1]),
          body: Column(
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text("Select Type ",
                  style: Theme.of(context).primaryTextTheme.headline1),
              Expanded(
                  child: ListView(
                children: [
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -110,
                    imgeSrc: "assets/icons/Practice_test.svg",
                    cardtext: "Practice Test",
                    onpressed: () {},
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -110,
                    imgeSrc: "assets/icons/exam.svg",
                    cardtext: "Evalution Exam",
                    onpressed: () {},
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
