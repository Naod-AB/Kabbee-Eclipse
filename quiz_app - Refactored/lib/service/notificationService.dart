import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'package:quiz_app/ui/Screens/Question/models/courses.dart';
import 'package:quiz_app/ui/Screens/Question/models/scores.dart';
//import 'package:quiz_app/ui/Screens/CommonControllers/initialController.dart';

import '../routes/router.gr.dart';
import 'services.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();
  Future<void> initNotification(BuildContext context) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    void onSelectNotify(String? payload) async {
      print("onselect notification ");
      QuestionController questionController = Get.find();
      //ProfileController profileController = Get.find();
      questionController.chosenCourse.value = payload!;
      questionController.selectedScore = (await findCourseScore(payload))!;
      Courses? courses = await findCourse(
        payload,
      );
      // context.router
      //     .push(ChooseTypeRoute(icon: courses!.icon, path: courses.courseName));
      // Get.toNamed('/choose-type', arguments: [
      //   courses!.icon,
      //   courses.courseName,
      //   questionController.selectedScore
      // ]);
    }

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotify);
    //       (String? payload) async {
    //     print("onselect notification ");
    //     QuestionController questionController = Get.find();
    //     //ProfileController profileController = Get.find();
    //     questionController.chosenCourse.value = payload!;
    //     questionController.selectedScore = (await findCourseScore(payload))!;
    //     Courses? courses = await findCourse(
    //       payload,
    //     );
    //     context.router
    //         .push(ChooseTypeRoute(icon: courses!.icon, path: courses.courseName));
    //     // Get.toNamed('/choose-type', arguments: [
    //     //   courses!.icon,
    //     //   courses.courseName,
    //     //   questionController.selectedScore
    //     // ]);
    //   });
    // }
  }

  Future showNotification(String title, String desc, String payload) async {
    var androidDetails = const AndroidNotificationDetails(
        "Channel ID", "Desi programmer",
        channelDescription: "This is my channel", importance: Importance.max);
    var iSODetails = const IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iSODetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, desc, generalNotificationDetails, payload: payload);
    await NotificationService()
        .flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
  }

  CourseScore findCoursScore(String courseName, ProfileController controller) {
    CourseScore scoreFound = CourseScore();
    for (var score in controller.scores) {
      if (score.courseName == courseName) {
        scoreFound = score;
        break;
      }
    }
    return scoreFound;
  }
}
