import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.id,
    this.question,
    this.options,
    this.answer,
  });

  int? id;
  String? question;
  String? options;
  String? answer;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["courseId"],
        question: json["question"],
        options: json["options"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "options": options,
        "answer": answer,
      };
}
