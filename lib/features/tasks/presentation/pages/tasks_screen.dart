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
  // Extend ConsumerState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) => const Text('Task screen'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
