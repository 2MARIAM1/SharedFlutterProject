import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_project/models/poste.dart';
import '../models/user.dart';

class GetAllPostsByUserService {
  final String baseUrl = 'http://localhost:8083/poste';

  Future<List<Poste>> getAllPosts(User currentUser) async {
    final Uri url = Uri.parse('$baseUrl/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      // Filter posts by currentUser
      final List<Poste> posts = responseData
          .map((data) => Poste.fromJson(data))
          .where((poste) => poste.user.id == currentUser.id)
          .toList();

      return posts;
    } else {
      throw Exception(
          'Failed to fetch posts for user. Status Code: ${response.statusCode}');
    }
  }
}
