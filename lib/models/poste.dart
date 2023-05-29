import 'package:flutter/foundation.dart';
import 'package:test_project/models/user.dart';

class Poste {
  final int id;
  final String cleaningType;
  final String location;
  final int estimatedPrice;
  final int surface;
  final DateTime serviceDate;
  final bool booked;
  final User user;

  Poste({
    required this.id,
    required this.cleaningType,
    required this.location,
    required this.estimatedPrice,
    required this.surface,
    required this.serviceDate,
    required this.booked,
    required this.user,
  });

  factory Poste.fromJson(Map<String, dynamic> json) {
    return Poste(
      id: json['id'],
      cleaningType: json['cleaningType'],
      location: json['location'],
      estimatedPrice: json['estimatedPrice'],
      surface: json['surface'],
      serviceDate: DateTime.parse(json['serviceDate']),
      booked: json['booked'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cleaningType': cleaningType,
      'location': location,
      'estimatedPrice': estimatedPrice,
      'surface': surface,
      'serviceDate': serviceDate.toIso8601String(),
      'booked': booked,
      'user': user.toJson(),
    };
  }
}
