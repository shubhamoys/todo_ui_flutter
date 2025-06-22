import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ui_flutter/core/theme/theme_provider.dart';
import 'package:todo_ui_flutter/core/utils/auth_utils.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    await AuthUtils.logout();
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile Screen',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 32),
              // Theme Switcher
              PopupMenuButton<ThemeMode>(
                onSelected: (themeMode) {
                  ref.read(themeProvider.notifier).setTheme(themeMode);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: ThemeMode.system,
                    child: Text('System Default'),
                  ),
                  const PopupMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light Theme'),
                  ),
                  const PopupMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark Theme'),
                  ),
                ],
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.color_lens),
                  label: const Text('Change Theme'),
                  onPressed: null, // Needed for style, actual action is menu
                ),
              ),
              const SizedBox(height: 16),
              // Logout Button
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                onPressed: () => _handleLogout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
