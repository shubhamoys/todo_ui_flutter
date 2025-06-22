import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/registration_params.dart';
import 'package:todo_ui_flutter/features/auth/domain/repositories/auth_repository.dart';

class RegistrationUseCase {
  final AuthRepository _authRepository;

  RegistrationUseCase(this._authRepository);

  /// Executes the registration use case with the given name, email and password
  /// Returns [AuthResponseModel] containing the registration result and user data
  /// Throws an [Exception] if the request fails
  Future<AuthResponseModel> execute(RegistrationParams params) async {
    // Input validation
    if (params.email.isEmpty || !params.email.contains('@')) {
      throw 'Invalid email format';
    }
    if (params.password.isEmpty || params.password.length < 6) {
      throw 'Password must be at least 6 characters';
    }

    if (params.password != params.confirmPassword) {
      throw 'Passwords do not match';
    }

    try {
      // Call the repository to perform login
      final response = await _authRepository.register(params);

      // If login is successful and we have a token, save it
      if (response.status && response.data?.token != null) {
        final tokenSaved =
            await _authRepository.saveToken(response.data!.token);
        if (!tokenSaved) {
          throw 'Failed to save authentication token';
        }
      }

      return response;
    } catch (e) {
      // Rethrow with a more user-friendly message
      throw e.toString();
    }
  }
}
