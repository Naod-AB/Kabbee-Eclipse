import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/Questions.dart';


class Controllo extends GetxController {
  final List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer'],
          options: question['options']))
      .toList();
  List<Question> get questions => _questions;
  List _groupValue = [].obs;

  List get groupValue => _groupValue;
  // RxInt _selectedAns = 1.obs;
  // RxInt get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  late int _numOfCorrectAns;
  int get numOfCorretAns => _numOfCorrectAns;
  RxString _selectedval = ''.obs;
  RxString get selectedval => _selectedval;

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
