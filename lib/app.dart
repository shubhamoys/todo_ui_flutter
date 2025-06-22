import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ui_flutter/core/widgets/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'package:todo_ui_flutter/config/routes/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeReady = ref.watch(themeReadyProvider);

    if (themeReady.isLoading) {
      // Wrap SplashScreen in MaterialApp to provide Directionality
      return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      );
    }

    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'UpToDo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode, // Use ThemeMode from provider
      routerConfig: appRouter, // Use GoRouter for navigation
    );
  }
}
