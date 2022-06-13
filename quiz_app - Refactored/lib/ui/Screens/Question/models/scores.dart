import 'dart:convert';

CourseScore welcomeFromJson(String str) =>
    CourseScore.fromJson(json.decode(str));

String welcomeToJson(CourseScore data) => json.encode(data.toJson());

class CourseScore {
  CourseScore({
    this.courseId,
    this.courseName,
    this.courseType,
    this.courseScore,
    this.coursePercentage,
    this.userId,
  });

  int? courseId;
  String? courseName;
  String? courseType;
  int? courseScore;
  int? userId;
  int? coursePercentage;

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
