import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/di/auth_providers.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/registration_params.dart';
import 'package:todo_ui_flutter/features/auth/domain/usecases/registration_usecase.dart';

class RegistrationState {
  final bool isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  final AuthResponseModel? authResponse;

  RegistrationState({
    this.isLoading = false,
    this.errorMessage,
    this.isAuthenticated = false,
    this.authResponse,
  });

  RegistrationState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
    AuthResponseModel? authResponse,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authResponse: authResponse ?? this.authResponse,
    );
  }
}

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  final RegistrationUseCase _registrationUseCase;

  RegistrationNotifier(this._registrationUseCase) : super(RegistrationState());

  Future<void> register(
      String name, email, String password, String confirmPassword) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final params = RegistrationParams(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      final response = await _registrationUseCase.execute(params);

      if (response.status) {
        state = state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          authResponse: response,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: response.error?.message ?? response.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() {
    state = RegistrationState();
  }
}

final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationState>((ref) {
  final registrationUseCase = ref.watch(registrationUseCaseProvider);
  return RegistrationNotifier(registrationUseCase);
});
