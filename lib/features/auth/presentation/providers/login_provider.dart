import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/di/auth_providers.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/login_params.dart';
import 'package:todo_ui_flutter/features/auth/domain/usecases/login_usecase.dart';

class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  final AuthResponseModel? authResponse;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isAuthenticated = false,
    this.authResponse,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
    AuthResponseModel? authResponse,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authResponse: authResponse ?? this.authResponse,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginNotifier(this._loginUseCase) : super(LoginState());

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final params = LoginParams(email: email, password: password);
      final response = await _loginUseCase.execute(params);

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
    state = LoginState();
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return LoginNotifier(loginUseCase);
});
