import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:quiz_app/Models/scores.dart';
import 'package:quiz_app/widgets/pallete.dart';

// import '../../api.dart';
import '../../widgets/score_alert_box.dart';
import '../../widgets/user_profile_widget.dart';

class MyScoresScreen extends StatelessWidget {
  const MyScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.fetchScore();
    print('LENGTH ${controller.scores!.length}');

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
        child: Expanded(
          child: GroupedListView<dynamic, String>(
            elements: controller.scores!,
            groupBy: (element) => element['courseType'],
            order: GroupedListOrder.ASC,
            groupSeparatorBuilder: (value) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                child: customText(value.toUpperCase(), 20, true, false, kblue),
              );
            },
            itemBuilder: (context, element) {
              return Card(
                color: Colors.white12,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(element['courseName'], 19, false, false,
                          primaryColor),
                      customText(element['courseScore'].toString() + ' / 4', 19,
                          false, false, primaryColor),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}


        
            // child: Expanded(
            //   child: ListView.separated(
            //       itemCount: controller.scores!.length,
            //       separatorBuilder: (BuildContext context, int index) =>
            //           Text('divider'),
            //       itemBuilder: ((context, index) {
            //         return ElevatedButton(
            //           onPressed: () {},
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(controller.scores![index]['courseName']),
            //       Text(controller.scores![index]['courseScore']
            //               .toString() +
            //           ' / 4'),
            //     ],
            //   ),
            //         );
            //       })),
            // )
