import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../api.dart';
import '../../notificationservice.dart';
import '../../routes/router.gr.dart';

import '../../widgets/theme.dart';
import '../../widgets/common_components/appbar.dart';
import '../../widgets/common_components/default_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationService().initNotification(context);
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
                    imgPosY: -130,
                    imgeSrc: "assets/icons/front end icons_small.svg",
                    cardtext: "Front-End",
                    onpressed: () async {
                      var course = await fetchCourses('Front-End');
                      context.router.push(LanguageChoices(courses: course));
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -130,
                    imgeSrc: "assets/icons/aws icons_small.svg",
                    cardtext: "Cloud-Service",
                    onpressed: () async {
                      var course = await fetchCourses('cloud_services');
                      context.router.push(LanguageChoices(courses: course));
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgheig: 280,
                    imgPosY: -130,
                    imgeSrc: "assets/icons/logos_nodejs-icon_small.svg",
                    cardtext: "Back-End",
                    onpressed: () async {
                      var course = await fetchCourses('Back_end');
                      context.router.push(LanguageChoices(courses: course));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

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
                    imgPosY: -130,
                    imgeSrc: "assets/icons/front end icons_small.svg",
                    cardtext: "Front-End",
                    onpressed: () async {
                      var course = await fetchCourses('Front-End');
                      context.router.push(LanguageChoices(courses: course));
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgPosY: -130,
                    imgeSrc: "assets/icons/aws icons_small.svg",
                    cardtext: "Cloud-Service",
                    onpressed: () async {
                      var course = await fetchCourses('cloud_services');
                      context.router.push(LanguageChoices(courses: course));
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding * 3,
                  ),
                  ChoiceCard(
                    imgheig: 280,
                    imgPosY: -130,
                    imgeSrc: "assets/icons/logos_nodejs-icon_small.svg",
                    cardtext: "Back-End",
                    onpressed: () async {
                      var course = await fetchCourses('Back_end');
                      context.router.push(LanguageChoices(courses: course));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
