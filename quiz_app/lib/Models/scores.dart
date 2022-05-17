import 'dart:convert';

CourseScore welcomeFromJson(String str) => CourseScore.fromJson(json.decode(str));

String welcomeToJson(CourseScore data) => json.encode(data.toJson());

class CourseScore {
    CourseScore({
        this.courseId,
        required this.courseName,
        required this.courseScore,
        required this.userId,
    });

    int? courseId;
    String courseName;
    int courseScore;
    int userId;

    factory CourseScore.fromJson(Map<String, dynamic> json) => CourseScore(
        courseId: json["courseId"],
        courseName: json["courseName"],
        courseScore: json["courseScore"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseName": courseName,
        "courseScore": courseScore,
        "userId": userId,
    };
}
