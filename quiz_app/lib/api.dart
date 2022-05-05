
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/Models/users.dart';


Future<Users> createUser(Users user)  async {
   
  final response = await  http.post(
    Uri.parse('http://localhost:3000/Users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id':'203',
      'email': user.email!,
      'firstName':user.firstName!,
      'lastName':user.lastName!,
      'password':user.password!,
      'gender':user.gender!
    }),
  );
  if (response.statusCode == 201) {
    
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Users.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(response.statusCode);
    throw Exception('Failed to create User.');
  }
} 
  Future<Users?> fetchUser(String email) async {
    final response = await http
      .get(Uri.parse('http://localhost:3000/Users?email=$email'));
      
      if(response.statusCode==200|| response.statusCode==304){

        if(!jsonDecode(response.body).isEmpty)
        {
          return Users.fromJson(jsonDecode(response.body)[0]);
        }else{
          
          return null;
        }
       
      }else{
        throw Exception('Failed to load User');
      }    
  }
 