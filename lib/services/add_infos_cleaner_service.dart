import 'dart:convert';
import 'package:http/http.dart' as http;

class AddInfosCleanerService {
  final String baseUrl = 'http://192.168.11.103:8083/user';

  Future<bool> addInfos(
      int id,
      String fullName,
      String cin,
      String phoneNumber,
      String email,
      String password,
      String region,
      String registration_type,
      String experience,
      int availability,
      List<String> workdays,
      List<String> cleaning_types,
      bool equipment,
      String description,
      ) async {
    try {
      final Map<String, dynamic> requestData = {
        'id': id,
        'fullName': fullName,
        'cin': cin,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'region': region,
        'registration_type': registration_type,
        'experience': experience,
        'availability': availability,
        'workdays': workdays,
        'cleaning_types': cleaning_types,
        'equipment': equipment,
        'description': description,
      };

      final String requestJson = jsonEncode(requestData);

      final response = await http.put(
        Uri.parse('$baseUrl/update'),
        headers: {'Content-Type': 'application/json'},
        body: requestJson,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error adding cleaner information: $e');
      return false;
    }
  }
}
