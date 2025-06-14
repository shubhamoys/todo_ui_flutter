import 'package:todo_ui_flutter/features/auth/data/models/user_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/entities/user_entity.dart';

class AuthResponseModel {
  final bool status;
  final String message;
  final AuthData? data;
  final AuthError? error;

  AuthResponseModel({
    required this.status,
    required this.message,
    this.data,
    this.error,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? AuthData.fromJson(json['data']) : null,
      error: json['error'] != null ? AuthError.fromJson(json['error']) : null,
    );
  }

  UserEntity? toEntity() {
    if (!status || data?.user == null) return null;

    return UserEntity(
      userId: data!.user.id,
      email: data!.user.email.value,
      name: data!.user.name,
      profilePicture: null, // Add if available in your API
      roles: [data!.user.role],
    );
  }
}

class AuthData {
  final String token;
  final UserModel user;

  AuthData({required this.token, required this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class AuthError {
  final int code;
  final String message;

  AuthError({required this.code, required this.message});

  factory AuthError.fromJson(Map<String, dynamic> json) {
    return AuthError(
      code: json['code'],
      message: json['message'],
    );
  }
}
