import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_ui_flutter/core/http/http_client.dart';

/// Core providers for app-wide dependencies
/// Used across multiple features

/// SharedPreferences provider
/// Initialized in main.dart with actual instance
/// Core provider for SharedPreferences instance
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
  // Will be overridden in main.dart after initialization
});

/// Core provider for HttpClient instance
final httpClientProvider = Provider<HttpClient>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return HttpClient(prefs);
});
