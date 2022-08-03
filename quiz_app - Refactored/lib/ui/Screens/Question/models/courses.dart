import 'dart:convert';

import 'package:get/get.dart';

Courses coursesFromJson(String str) => Courses.fromJson(json.decode(str));

String coursesToJson(Courses data) => json.encode(data.toJson());

class Courses {
  Courses(
      {required this.id,
      required this.courseName,
      this.recommnedationLinks,
      this.percentage,
      required this.category,
      this.icon});

  double? iconwidX, iconHeigx, iconPosY, iconPosy;
  int id;
  String courseName;
  String? recommnedationLinks;
  String category;
  String? icon;
  int? percentage;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        id: json["courseId"],
        courseName: json["courseName"],
        category: json["category"],
        icon: json["icon"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseName".tr: courseName,
        "category": category,
        "icon": icon,
        "percentage": percentage,
      };
}
