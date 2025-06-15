import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/login_params.dart';

abstract class AuthRepository {
  /// Authenticates a user with email and password
  /// Returns a [AuthResponseModel] containing the login result
  /// Throws an [Exception] if the request fails
  Future<AuthResponseModel> login(LoginParams params);

  /// Saves the authenticated user's token securely
  /// Returns true if successful, false otherwise
  Future<bool> saveToken(String token);

  /// Gets the authenticated user's token
  /// Returns the token if found, null otherwise
  Future<String?> getToken();

  /// Removes the authenticated user's token
  /// Returns true if successful, false otherwise
  Future<bool> removeToken();
}
