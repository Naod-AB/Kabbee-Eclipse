import 'dart:convert';

checkAnswer welcomeFromJson(String str) =>
    checkAnswer.fromJson(json.decode(str));

class checkAnswer {
  var id;
  var answer;
  bool isCorrect;
  bool isSelected;

  checkAnswer(
      {this.id,
      this.answer,
      required this.isCorrect,
      required this.isSelected});

  factory checkAnswer.fromJson(Map<String, dynamic> json) {
    return checkAnswer(
      id: json['id'],
      answer: json['answer'],
      isCorrect: json['isCorrect'],
      isSelected: json['isSelected'],
    );
  }
}
