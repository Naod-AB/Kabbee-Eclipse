import 'dart:convert';

CourseScore courseScoreFromJson(String str) =>
    CourseScore.fromJson(json.decode(str));

String courseScoreToJson(CourseScore data) => json.encode(data.toJson());

class CourseScore {
  CourseScore(
      {this.courseId,
      this.courseName,
      this.courseType,
      this.courseScore,
      this.coursePercentage,
      this.userId,
      this.counter,
      this.blocked,
      this.takenDate});

  String? courseId;
  String? courseName;
  String? courseType;
  int? courseScore;
  int? userId;
  int? coursePercentage;
  int? counter;
  bool? blocked;
  String? takenDate;

  factory CourseScore.fromJson(Map<String, dynamic> json) => CourseScore(
      courseId: json["id"],
      courseName: json["courseName"],
      courseType: json["courseType"],
      courseScore: json["courseScore"],
      coursePercentage: json["percentage"],
      userId: json["userId"],
      counter: json["counter"],
      takenDate: json["takendate"],
      blocked: json["blocked"]);

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseName": courseName,
        "courseType": courseType,
        "courseScore": courseScore,
        "percentage": coursePercentage,
        "userId": userId,
        "blocked": blocked,
        "counter": counter,
        "takendate": takenDate
      };
}
