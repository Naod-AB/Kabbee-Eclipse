

class Courses {
  int id;
  String courseName;
  String? recommnedationLinks;
  String category;
  String? icon;
  Courses({  required this.id, required this.courseName,this.recommnedationLinks,required this.category,this.icon});

    // Courses(id: 5, courseName: "Spring-boot",category: "Front-End"),
    // Courses(id: 6, courseName: "NodeJs",category: "Back-End"),
    // Courses(id: 7, courseName: "AWS",category: "Cloud-Computing"),
    // Courses(id: 8, courseName: "PHP",category: "Back-End"), 

}
List<Courses> courses = [
    Courses( 
      id: 1, 
      courseName: "HTML",
      category: "Front-End",
      icon:"assets/icons/html.svg"),
    Courses(
      id: 2, 
      courseName:"Dart",
      category: "Front-End",
      icon:"assets/icons/dart.svg"),
    Courses(
      id:4, 
      courseName: "Angular",
      category: "Front-End",
      icon: "assets/icons/html.svg"),
    ];


