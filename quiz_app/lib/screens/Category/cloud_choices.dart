// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controllers/question_controller.dart';
// import '../../routes/router.gr.dart';
// import '../../widgets/common_components/circularScrore.dart';
// import '../../widgets/theme.dart';
// import '../../widgets/common_components/appbar.dart';
// import '../../widgets/common_components/default_card.dart';
// import '../../Models/courses.dart';

// class CloudChoices extends StatelessWidget {
//   CloudChoices({Key? key}) : super(key: key);
//   QuestionControl qController = Get.put(QuestionControl());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: bgColor,
//           appBar: quizeAppbar(context),
//           body: Column(
//             children: [
//               const SizedBox(
//                 height: defaultPadding,
//               ),
//               Text("Select Language",
//                   style: Theme.of(context).primaryTextTheme.headline1),
//               Expanded(
//                 child: ListView.separated(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: defaultPadding * 3),
//                   itemCount: cloudCourse.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return ChoiceCard(
//                         child: CircularScore(),
//                         imgPosY: -110,
//                         imgeSrc: cloudCourse[index].icon!,
//                         cardtext: cloudCourse[index].courseName,
//                         onpressed: () {
//                           qController.chosenCourse.value =
//                               cloudCourse[index].courseName;
//                           qController.chosenCourseType.value =
//                               cloudCourse[index].category;

//                           print("this is the course");
//                           print(qController.chosenCourse.value);
//                           context.router.push(ChooseType(
//                               icon: cloudCourse[index].icon,
//                               path: cloudCourse[index].courseName));
//                         });
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return const SizedBox(
//                       height: defaultPadding * 3,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
