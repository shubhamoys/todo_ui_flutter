import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/config/env/environment_config.dart';
import 'package:todo_ui_flutter/core/widgets/snackbar/app_snackbar.dart';

class TaskScreen extends ConsumerStatefulWidget {
  // Change to ConsumerStatefulWidget
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() =>
      _TaskScreenState(); // Use ConsumerState
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  // Future<void> _handleLogout() async {
  //   await AuthUtils.logout();
  //   if (mounted) {
  //     context.go('/login');
  //   }
  // }

  // Extend ConsumerState
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Builder(
            builder: (context) => const Text('Task screen'),
          ),
          // actions: [
          //   PopupMenuButton<ThemeMode>(
          //     onSelected: (themeMode) {
          //       ref
          //           .read(themeProvider.notifier)
          //           .setTheme(themeMode); // Use ref from ConsumerState
          //     },
          //     itemBuilder: (context) => [
          //       const PopupMenuItem(
          //         value: ThemeMode.system,
          //         child: Text('System Default'),
          //       ),
          //       const PopupMenuItem(
          //         value: ThemeMode.light,
          //         child: Text('Light Theme'),
          //       ),
          //       const PopupMenuItem(
          //         value: ThemeMode.dark,
          //         child: Text('Dark Theme'),
          //       ),
          //     ],
          //   ),
          //   // Logout button
          //   IconButton(
          //     icon: const Icon(Icons.logout),
          //     onPressed: _handleLogout,
          //     tooltip: 'Logout',
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          // Wrap content in SingleChildScrollView
          child: Center(
            child: Builder(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'App Name: ${EnvironmentConfig.appName}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      AppSnackbar.showSuccess(context, 'Operation Successful!');
                    },
                    child: const Text('Show Success Message'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      AppSnackbar.showError(context, 'Something went wrong!');
                    },
                    child: const Text('Show Error Message'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Go to Login'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/task/1');
                    },
                    child: const Text('Go to Task Details'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
