import 'package:todo_ui_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/login_params.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  /// Executes the login use case with the given email and password
  /// Returns [AuthResponseModel] containing the login result and user data
  /// Throws an [Exception] if the request fails
  Future<AuthResponseModel> execute(LoginParams params) async {
    // Input validation
    if (params.email.isEmpty || !params.email.contains('@')) {
      throw Exception('Invalid email format');
    }
    if (params.password.isEmpty || params.password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    try {
      // Call the repository to perform login
      final response = await _authRepository.login(params);

      // If login is successful and we have a token, save it
      if (response.status && response.data?.token != null) {
        final tokenSaved =
            await _authRepository.saveToken(response.data!.token);
        if (!tokenSaved) {
          throw Exception('Failed to save authentication token');
        }
      }

      return response;
    } catch (e) {
      // Rethrow with a more user-friendly message
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}
