import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/utils/theme.dart';

AppBar quizAppBar({required BuildContext context, String? iconUrl}) {
  return AppBar(
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    elevation: 0,
    title: CircleAvatar(
      child: iconUrl != null ? SvgPicture.asset(iconUrl) : SvgPicture.asset(''),
      backgroundColor: Colors.transparent,
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(defaultPadding / 3),
        child: GestureDetector(
            onTap: () {
              context.router.pushNamed('/profile');
            },
            child: profilePic()),
      ),
    ],
  );
}

// AppBar quizeAppbar(BuildContext context) {
//   return AppBar(
//     backgroundColor: appbarColor,
//     actions: [
//       Padding(
//         padding: const EdgeInsets.only(right: defaultPadding / 2),
//         child: GestureDetector(
//           onTap: () {
//             context.router.pushNamed('/profile');
//           },
//           child: profilePic(),
//         ),
//       )
//     ],
//   );
// }

// AppBar QuizeAppbar(String iconUrl, BuildContext context) {
//   return AppBar(
//     backgroundColor: appbarColor,
//     title: CircleAvatar(
//       child: SvgPicture.asset(iconUrl),
//       backgroundColor: Colors.transparent,
//     ),
//     centerTitle: true,
//     actions: [
//       Padding(
//         padding: const EdgeInsets.only(right: defaultPadding / 2),
//         child: GestureDetector(
//             onTap: () {
//               context.router.pushNamed('/profile');
//             },
//             child: profilePic()),
//       ),
//     ],
//   );

//   // ),
// }

// AppBar quizeAppbar2(String iconUrl) {
//   return AppBar(
//     title: Center(
//       child: CircleAvatar(child: SvgPicture.asset(iconUrl)),
//     ),
//     backgroundColor: appbarColor,
//     actions: [
//       Padding(
//         padding: const EdgeInsets.only(right: defaultPadding / 2),
//         child: InkWell(
//             onTap: () {
//              Get.to(ProfileScreen());
//             },
//             child: const CircleAvatar(
//               foregroundImage: AssetImage("assets/images/profile_pic_demo.jpg"),
//             )),
//       ),
//     ],
//   );
// }

Widget profilePic() {
  return Obx(
    () => controller.editedImage.value == ''
        ? ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              width: 60,
              height: 60,
              image: AssetImage('assets/images/avatar.png'),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: !kIsWeb
                ? Image.file(
                    File(controller.editedImage.value),
                    fit: BoxFit.fill,
                    width: 60,
                    height: 60,
                  )
                : Image.network(
                    controller.editedImage.value,
                    fit: BoxFit.fill,
                    width: 60,
                    height: 60,
                  ),
          ),
  );
}
