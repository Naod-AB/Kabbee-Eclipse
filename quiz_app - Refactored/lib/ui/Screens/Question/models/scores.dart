import 'dart:convert';

CourseScore courseScoreFromJson(String str) =>
    CourseScore.fromJson(json.decode(str));

String courseScoreToJson(CourseScore data) => json.encode(data.toJson());

class CourseScore {
  CourseScore({
    this.courseId,
    this.courseName,
    this.courseType,
    this.courseScore,
    this.coursePercentage,
    this.userId,
  });

  String? courseId;
  String? courseName;
  String? courseType;
  int? courseScore;
  int? userId;
  double? coursePercentage;

  factory CourseScore.fromJson(Map<String, dynamic> json) => CourseScore(
        courseId: json["courseId"],
        courseName: json["courseName"],
        courseType: json["courseType"],
        courseScore: json["courseScore"],
        coursePercentage: json["percentage"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseName": courseName,
        "courseType": courseType,
        "courseScore": courseScore,
        "percentage": coursePercentage,
        "userId": userId,
      };
}
