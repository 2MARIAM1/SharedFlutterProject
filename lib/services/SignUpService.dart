import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  final String baseUrl = 'http://10.10.10.211:8083/user';

  Future<bool> signUp(
    String fullName,
    String cin,
    String phoneNumber,
    String email,
    String password, String region,
    String registration_type,
  ) async {


    final Map<String, dynamic> requestData = {
      'fullName': fullName,
      'cin': cin,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'region': region,
      'registration_type': registration_type,
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
      String email, String password, String registration_type) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'fullName': fullName,
        'cin': cin,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        "registration_type": registration_type,
      }),
    );

    return response.statusCode == 201;
  }
}
*/