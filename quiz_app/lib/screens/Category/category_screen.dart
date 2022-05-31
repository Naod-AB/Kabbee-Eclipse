// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/widgets/common_components/circularScrore.dart';
import '../../widgets/theme.dart';
import '../../widgets/common_components/appbar.dart';
import '../../widgets/common_components/default_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: quizeAppbar(context),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Text("Select Category",
                      style: Theme.of(context).primaryTextTheme.headline1),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    child: CircularScore(),
                    //textPosx: 25,
                    imgPosY: -130,
                    //imgPosX: 185,
                    imgeSrc: "assets/icons/front end icons_small.svg",
                    cardtext: "Front-End",
                    onpressed: () {
                      context.router.pushNamed('/frontend');
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                     child: CircularScore(),
                    imgPosY: -130,
                    imgeSrc: "assets/icons/aws icons_small.svg",
                    //imgPosX: 185,
                    cardtext: "Cloud-Service",
                    onpressed: () {
                      context.router.pushNamed('/cloud');
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                     child: CircularScore(),
                    imgheig: 280,
                    //imgPosX: 185,
                    imgPosY: -130,
                    imgeSrc: "assets/icons/logos_nodejs-icon_small.svg",
                    cardtext: "Back-End",
                    onpressed: () {
                      context.router.pushNamed('/backend');
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
