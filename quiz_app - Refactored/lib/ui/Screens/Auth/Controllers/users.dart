import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.gender,
    this.status,
    this.role,
  });
  dynamic id;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? gender;
  String? status;
  String? role;

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json["id"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      password: json["password"],
      gender: json["gender"],
      status: json["status"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "gender": gender,
      };
}
