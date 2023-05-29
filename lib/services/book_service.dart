import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class BookService {
  final String baseUrl = 'http://10.10.10.211:8083/poste';

  Future<bool> Book(

      String cleaningType,
      String location,
      int estimatedPrice,
      int surface,
      DateTime serviceDate,
      bool booked,
      User user,
      ) async {


    final Map<String, dynamic> requestData = {
      'cleaningType': cleaningType,
      'location': location,
      'estimatedPrice': estimatedPrice,
      'surface': surface,
      'serviceDate': serviceDate.toIso8601String(),
      'booked': booked,
      'user': user.toJson(),
    };

    final String requestJson = jsonEncode(requestData);

    final response = await http.put(
      Uri.parse('$baseUrl/update'),
      headers: {'Content-Type': 'application/json'},
      body: requestJson,
    );

    return response.statusCode == 200;

  }
}