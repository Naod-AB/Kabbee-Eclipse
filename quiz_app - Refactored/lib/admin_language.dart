import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'service/api.dart';
import 'ui/Screens/Profile/widgets/user_profile_widget.dart';

class AdminLanguage extends StatelessWidget {
  const AdminLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.fetchCoursesAndCategories);
    return Scaffold(
        appBar: AppBar(
          title: Text('Courses'),
        ),
        body: ListView.builder(
          itemCount: controller.fetchCoursesAndCategories.length,
          itemBuilder: (context, index) {
            var language = controller.fetchCoursesAndCategories[index];
            print(language);
            return buildlanguageTiles(
                SvgPicture.asset(
                  language["icon"],
                  height: 50,
                ),
                language['courseName'],
                language['category'],
                4);
          },
        ));
  }
}
// buildlanguageTiles(SvgPicture.asset("assets/icons/html.svg"),
//             "html and css", "frontend", 4)