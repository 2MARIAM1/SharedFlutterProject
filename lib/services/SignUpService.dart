import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  final String baseUrl = 'http://localhost:8083/user';

  Future<bool> signUp(
    String fullName,
    String cin,
    String phoneNumber,
    String email,
    String password, String region,
    String registrationType,
  ) async {


    final Map<String, dynamic> requestData = {
      'fullName': fullName,
      'cin': cin,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'region': region,
      'registrationType': registrationType,
    };

    final String requestJson = jsonEncode(requestData);

    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: requestJson,
    );

    return response.statusCode == 201;

  }
}
/*

class SignUpService {
  final String baseUrl = 'http://localhost:8083/user';

  Future<bool> signUp(String fullName, String cin, String phoneNumber,
      String email, String password, String registrationType) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'fullName': fullName,
        'cin': cin,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        "registrationType": registrationType,
      }),
    );

    return response.statusCode == 201;
  }
}
*/