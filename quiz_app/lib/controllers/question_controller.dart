import 'package:get/get.dart';
import 'package:quiz_app/Models/scores.dart';
import 'package:quiz_app/controllers/profile_controllers.dart';

class ChosenModel {
  final int questionNumber;
  final String questionAnswer;

  ChosenModel(this.questionNumber, this.questionAnswer);

  @override
  String toString() {
    return '$questionNumber $questionAnswer';
  }
}

class QuestionControl extends GetxController {
  ProfileController pController = Get.find();
  RxString chosenCourse = ''.obs;
  RxString chosenCourseType = ''.obs;
  RxBool isEnabled = true.obs;
  int optionList = 0;
  CourseScore selectedScore = CourseScore();

  RxInt h = 0.obs;
  RxInt m = 0.obs;
  RxInt s = 25.obs;

  bool isFinished = false;

  List<ChosenModel> chosenAnswers = [];

  RxList groupValue = [-1, 0, 5, 9, 13].obs;
  RxList value = [
    [0, 1, 2, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
  ].obs;
  RxInt qnIndex = 1.obs;
  int count = 0;
  RxBool isCorrect = false.obs;
  bool isSelected = false;
  CourseScore? fetchSelectedCourseScore() {
    for (var element in pController.scores!) {
      print(chosenCourse.value);
      if (element.courseName == chosenCourse.value) {
        selectedScore = element;
        print(element.courseId);
      }
    }
    return selectedScore;
  }
}
