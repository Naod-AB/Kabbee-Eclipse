// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:quiz_app/ui/utils/theme.dart';
// import 'appbar.dart';

// AppBar evaluAppbar(String iconUrl, BuildContext context) {
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
//           onTap: () {
//             context.router.pushNamed('/profile');
//           },
//           child: profilePic(),
//         ),
//       )
//     ],
//     automaticallyImplyLeading: false,
//   );
// }
