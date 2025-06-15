class UserModel {
  final String id;
  final String name;
  final EmailModel email;
  final PasswordModel password;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: EmailModel.fromJson(json['email']),
      password: PasswordModel.fromJson(json['password']),
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class EmailModel {
  final String value;
  final bool verified;

  EmailModel({required this.value, required this.verified});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      value: json['value'],
      verified: json['verified'],
    );
  }
}

class PasswordModel {
  final bool reset;
  final DateTime updatedAt;

  PasswordModel({required this.reset, required this.updatedAt});

  factory PasswordModel.fromJson(Map<String, dynamic> json) {
    return PasswordModel(
      reset: json['reset'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
