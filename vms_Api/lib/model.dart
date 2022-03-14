// ignore_for_file: prefer_typing_uninitialized_variables

class NameListJson {
  var id;
  var name;
  var role;
  var time;
  var checkStatus;

  NameListJson({this.id, this.name, this.checkStatus, this.role, this.time});

  factory NameListJson.fromJson(Map<String, dynamic> json) {
    return NameListJson(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      checkStatus: json['checkStatus'],
      time: json['checkedInTime'],
    );
  }
}
