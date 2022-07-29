import 'dart:convert';

CheckAnswer checkAnswerFromJson(String str) =>
    CheckAnswer.fromJson(json.decode(str));

class CheckAnswer {
  var id;
  var answer;
  bool isCorrect;
  bool isSelected;

  CheckAnswer(
      {this.id,
      this.answer,
      required this.isCorrect,
      required this.isSelected});

  factory CheckAnswer.fromJson(Map<String, dynamic> json) {
    return CheckAnswer(
      id: json['id'],
      answer: json['answer'],
      isCorrect: json['isCorrect'],
      isSelected: json['isSelected'],
    );
  }
}
