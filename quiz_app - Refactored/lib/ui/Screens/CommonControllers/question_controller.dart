import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/profile_controllers.dart';

import '../../../service/notificationService.dart';
import '../../../service/services.dart';
import '../Question/models/scores.dart';

class QuestionController extends GetxController {
  List? questionApi;
  RxString chosenCourse = ''.obs;
  RxString chosenCourseType = ''.obs;
  int examCounter = 0;
  bool isFinal = false;
  CourseScore selectedScore = CourseScore();
  Rx<ScrollController> scrolController = ScrollController().obs;
  Rx<ScrollController> reviewScrolController = ScrollController().obs;
  ProfileController pController = Get.put(ProfileController());

  int optionList = 0;

  RxBool isEnabled = true.obs;
  bool isFinished = false;

// Groupping Radio button for each question
  RxList groupValue = [-1, 0, 5, 9, 13, 17, 21, 25, 29, 33, 37].obs;
  RxList value = [
    [0, 1, 2, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16],
    [17, 18, 19, 20],
    [21, 22, 23, 24],
    [25, 26, 27, 28],
    [29, 30, 31, 32],
    [33, 34, 35, 36],
    [37, 38, 39, 40]
  ].obs;
  RxInt qnIndex = 1.obs;
  int count = 0;

  // For Evaluation question Timer
  RxInt hour = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 25.obs;

  //
  List answers = [];
  List choices = [];
  int scoreCounter = 0;
  CourseScore? fetchSelectedCourseScore() {
    for (var element in pController.scores) {
      print(chosenCourse.value);
      if (element.courseName == chosenCourse.value) {
        selectedScore = element;
        print(element.courseName);
      }
    }
    return selectedScore;
  }

  Future<int> checkExamCounter(int scorePercentage) async {
    CourseScore course;
    print("this is the selected score" + selectedScore.courseName!);
    examCounter = selectedScore.counter!;
    if (scorePercentage < 60) {
      examCounter++;
      print("increamented the examCounter " + examCounter.toString());
    }
    if (examCounter >= 2) {
      print(
          "block the user from taking the task  by setting blockked to true ");
      selectedScore.blocked = true;
      updateExamcounter(selectedScore);
      await Future.delayed(Duration(seconds: 20)).then((value) {
        NotificationService().showNotification(
            "Unlocked",
            "${selectedScore.courseName} has been unblocked, you can take the exam now ",
            selectedScore.courseName!);
        selectedScore.blocked = false;
        selectedScore.counter = 0;
        updateExamcounter(selectedScore);
      });
    } else {
      selectedScore.blocked = false;
      updateExamcounter(selectedScore);
    }
    return examCounter;
  }
}
