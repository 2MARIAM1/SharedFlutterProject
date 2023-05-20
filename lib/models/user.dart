class User {
  int? id;
  String? fullName;
  String? cin;
  String? phoneNumber;
  String? email;
  String? password;
  String? region;
  String? registrationType;

  User({
    this.id,
    this.fullName,
    this.cin,
    this.phoneNumber,
    this.email,
    this.password,
    this.region,
    this.registrationType,
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
      registrationType: json['registrationType'],
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
        'registrationType': registrationType,
      };
}
