import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_project/models/poste.dart';
import '../models/user.dart';

class GetAllPostsService {
  final String baseUrl = 'http://localhost:8083/poste';

  Future<List<Poste>> getAllPosts() async {
    final Uri url = Uri.parse('$baseUrl/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<Poste> posts =
          responseData.map((data) => Poste.fromJson(data)).toList();

      return posts;
    } else {
      throw Exception(
          'Failed to fetch posts. Status Code: ${response.statusCode}');
    }
  }
}
