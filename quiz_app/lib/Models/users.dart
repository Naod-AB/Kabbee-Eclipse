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
    });
    dynamic? id;
    String? email;
    String? firstName;
    String? lastName;
    String? password;
    String? gender;

    factory Users.fromJson(Map<String, dynamic> json) { 
      print("inide the fromJson");
      return Users(
        id:json["id"],
        email: json["email"], 
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        gender: json["gender"],
    );}

    Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "gender": gender,
      };
}

// class Users{

//   String? email;
//   String? firstName;
//   String? lastName;
//   String? password;
//   String? gender;
//   Users({this.email,this.firstName,this.lastName,this.password,this.gender});

// }