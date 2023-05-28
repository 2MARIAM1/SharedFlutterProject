class User {
  int? id;
  String? fullName;
  String? cin;
  String? phoneNumber;
  String? email;
  String? password;
  String? region;
  String? registration_type;
  String? experience;
  int? availability;
  List<String>? workdays;
  List<String>? cleaning_types;
  bool? equipment;
  String? description;

  User({
    this.id,
    this.fullName,
    this.cin,
    this.phoneNumber,
    this.email,
    this.password,
    this.region,
    this.registration_type,
    this.experience,
    this.availability,
    this.workdays,
    this.cleaning_types,
    this.equipment,
    this.description,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      cin: json['cin'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      region: json['region'],
      registration_type: json['registration_type'],
      experience: json['experience'],
      availability: json['availability'],
      workdays: List<String>.from(json['workdays']),
      cleaning_types: List<String>.from(json['cleaning_types']),
      equipment: json['equipment'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
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
}
