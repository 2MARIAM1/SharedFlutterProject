import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService {
  final String _baseUrl = "http://192.168.11.103:8083/user";

  Future<String?> authenticate(String email, String password) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/all'));

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);

        final user = users.firstWhere(
              (u) => u['email'] == email && u['password'] == password,
          orElse: () => null,
        );

        if (user != null) {
          final String registrationType = user['registrationType'];

          return registrationType;
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
        final String registrationType = user['registrationType'];

        return registrationType;
      }
    }

    // authentication failed
    return null;
  }*/
