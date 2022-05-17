import 'package:get/get.dart';

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
  RxString chosenCourse=''.obs;
  List questions = [
    {
      "id": 1,
      "question":
          "Flutter is an open-source UI software development kit created by ______",
      "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
      "answer": "Google",
    },
    {
      "id": 2,
      "question": "When google release Flutter.",
      "options": ['Jun 2017', 'July 2017', 'May 2017', 'May 2018'],
      "answer": "Jun 2017",
    },
    {
      "id": 3,
      "question": "A memory location that holds a single letter or number.",
      "options": ['Double', 'Int', 'Char', 'Word'],
      "answer": "Char",
    },
    {
      "id": 4,
      "question": "What command do you use to output data to the screen?",
      "options": ['Cin', 'Count', 'Cout', 'Output'],
      "answer": "Output",
    },
  ].obs;

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
}
