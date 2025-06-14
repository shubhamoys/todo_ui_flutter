import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ui_flutter/core/di/providers.dart';
import 'package:todo_ui_flutter/features/auth/data/datasources/login_remote_data_source.dart';
import 'package:todo_ui_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todo_ui_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_ui_flutter/features/auth/domain/usecases/login_usecase.dart';

/// Providers for Auth feature dependencies

// Data Sources
final loginRemoteDataSourceProvider = Provider<LoginRemoteDataSource>((ref) {
  final client = ref.watch(httpClientProvider);
  return LoginRemoteDataSource(client);
});

// Repositories
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final loginDataSource = ref.watch(loginRemoteDataSourceProvider);
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return AuthRepositoryImpl(loginDataSource, sharedPrefs);
});

// Use Cases
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});
