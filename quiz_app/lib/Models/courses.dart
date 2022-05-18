class Courses {
  double? iconwidX, iconHeigx, iconPosY, iconPosy;
  int id;
  String courseName;
  String? recommnedationLinks;
  String category;
  String? icon;
  Courses(
      {required this.id,
      required this.courseName,
      this.recommnedationLinks,
      required this.category,
      this.icon});
}

List<Courses> frontendCourses = [
  Courses(
      id: 1,
      courseName: "HTML_CSS",
      category: "Front-End",
      icon: "assets/icons/html.svg"),
  Courses(
      id: 2,
      courseName: "Dart",
      category: "Front-End",
      icon: "assets/icons/dart.svg"),
  Courses(
      id: 3,
      courseName: "Flutter",
      category: "Front-End",
      icon: "assets/icons/flutter.svg"),
];
List<Courses> cloudCourse = [
  Courses(
      id: 1,
      courseName: "Machine_Learning",
      category: "cloud_services",
      icon: "assets/icons/Machine_logo.svg"),
  Courses(
      id: 2,
      courseName: "Cloud_Computing",
      category: "cloud_services",
      icon: "assets/icons/computing_icon.svg"),
  Courses(
      id: 3,
      courseName: "Analaytics",
      category: "cloud_services",
      icon: "assets/icons/analytics_logo.svg"),
];
List<Courses> backCourse = [
  Courses(
      id: 1,
      courseName: "javascript",
      category: "Back_end",
      icon: "assets/icons/javascript_icon.svg"),
  Courses(
      id: 2,
      courseName: "MongoDB",
      category: "Back_end",
      icon: "assets/icons/monogodb_icon.svg"),
  Courses(
      id: 3,
      courseName: "Atlas_Cloud",
      category: "Back_end",
      icon: "assets/icons/atlas_icon.svg"),
];
