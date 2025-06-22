import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  bool _loaded = false;

  ThemeNotifier() : super(ThemeMode.system) {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('themeMode') ?? 'system';
    switch (theme) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }

    _loaded = true;
  }

  Future<void> ensureLoaded() async {
    if (!_loaded) {
      await _loadThemePreference();
    }
  }

  void setTheme(ThemeMode themeMode) async {
    state = themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'themeMode', themeMode.name); // Save as 'light', 'dark', or 'system'
  }
}

final themeReadyProvider = FutureProvider<void>((ref) async {
  await ref.read(themeProvider.notifier).ensureLoaded();
});
