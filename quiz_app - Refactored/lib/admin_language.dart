import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/ui/utils/string_extension.dart';

import 'ui/Screens/Profile/widgets/user_profile_widget.dart';

class AdminLanguage extends StatelessWidget {
  const AdminLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(controller.fetchCoursesAndCategories);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Courses'),
          centerTitle: false,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListView.builder(
            itemCount: controller.fetchCoursesAndCategories.length,
            itemBuilder: (context, index) {
              var language = controller.fetchCoursesAndCategories[index];

              List questions = controller.fetchquestionLengths
                  .where((element) =>
                      element["topic"] ==
                      controller.fetchCoursesAndCategories[index]['courseName']
                          .toString()
                          .toUpperCase())
                  .toList();

              print(language["icon"]);

              return Card(
                color: Theme.of(context).colorScheme.tertiary,
                child: buildlanguageTiles(
                  SvgPicture.asset(
                    language["icon"],
                    height: 40,
                  ),
                  language['courseName']
                      .toString()
                      .replaceAll('_', ' ')
                      .toUpperCase(),
                  language['category']
                      .toString()
                      .replaceAll('-', ' ')
                      .toString()
                      .toCapitalized()
                      .replaceAll('_', ' '),
                  questions.length,
                  context,
                ),
              );
            },
          ),
        ));
  }
}
