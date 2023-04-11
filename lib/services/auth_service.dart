import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<bool> authenticate(String email, String password) async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);

      final user = users.firstWhere(
        (u) => u['email'] == email && u['website'] == password,
        orElse: () => null,
      );

      if (user != null) {
        return true;
      }
    }

    // authentication failed
    return false;
  }
}
