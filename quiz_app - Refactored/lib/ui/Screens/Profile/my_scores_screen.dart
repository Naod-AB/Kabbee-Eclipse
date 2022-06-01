import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/Profile/widgets/user_profile_widget.dart';
import 'package:quiz_app/ui/common_widgets/score_alert_box.dart';
import 'package:quiz_app/ui/utils/pallete.dart';



class MyScoresScreen extends GetView<ProfileController> {
  MyScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorCode;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: customText('My Scores', 18, false, false, primaryColor),
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: controller.scores == null ||
                controller.scores!.any(
                  (data) => data['courseType'] == null,
                )
            ? const ScoreAlertBox()
            : Expanded(
                child: GroupedListView<dynamic, String>(
                  elements: controller.scores!,
                  groupBy: (element) => element['courseType'],
                  order: GroupedListOrder.ASC,
                  groupSeparatorBuilder: (value) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                      child: customText(
                          value.toUpperCase(), 20, true, false, kblue),
                    );
                  },
                  itemBuilder: (context, element) {
                    colorCode = element['percentage'];
                    // print(colorCode.runtimeType);

                    return Stack(
                      children: [
                        Card(
                          color: Colors.white12,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(element['courseName'], 19, false,
                                    false, primaryColor),
                                customText('${element['percentage']} %', 19,
                                    true, false, primaryColor),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 3.5,
                            left: 2,
                            child: Container(
                              height: 60,
                              width: 5,
                              decoration: BoxDecoration(
                                color: colorCode > 75
                                    ? Colors.green
                                    : colorCode > 50
                                        ? Colors.blue
                                        : colorCode > 25
                                            ? Colors.yellow
                                            : colorCode <= 25
                                                ? Colors.red
                                                : Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                ),
                              ),
                            )),
                      ],
                    );
                  },
                ),
              ),
      ),
    ));
  }
}
