import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService {
  final String _baseUrl = "http://10.10.10.211:8083/user";

  Future<User?> authenticate(String email, String password) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/all'));

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);

        final user = users.firstWhere(
              (u) => u['email'] == email && u['password'] == password,
          orElse: () => null,
        );

        if (user != null) {
          return  User.fromJson(user);
        }
      }
    }on SocketException{
      print("CHECK CONNECTION !!!");
    }on FormatException{
      print("ERROR RETREIVING DATA !!");
    }
    catch(exp){
        print("SERVICE ERROR");
    }

    // authentication failed
    return null;
  }
}

/*Future<String?> authenticate(String email, String password) async {
    final response = await http.get(Uri.parse('$_baseUrl/all'));

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);

      final user = users.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
        orElse: () => null,
      );

      if (user != null) {
        final String registration_type = user['registration_type'];

        return registration_type;
      }
    }

    // authentication failed
    return null;
  }*/
