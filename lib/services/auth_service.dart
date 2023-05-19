import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://localhost:8083/user';

  Future<String?> authenticate(String email, String password) async {
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
  }
}
