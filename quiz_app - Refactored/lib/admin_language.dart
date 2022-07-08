import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ui/Screens/Profile/widgets/user_profile_widget.dart';

class AdminLanguage extends StatelessWidget {
  const AdminLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Center(
        child: buildlanguageTiles(
          SvgPicture.asset("assets/icons/html.svg"),
          "html and css",
          "frontend",
        ),
      ),
    );
  }
}
