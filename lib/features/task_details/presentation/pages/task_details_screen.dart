import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/theme/theme_provider.dart';

class TaskDetailScreen extends ConsumerStatefulWidget {
  // Change to ConsumerStatefulWidget
  const TaskDetailScreen({super.key});

  @override
  ConsumerState<TaskDetailScreen> createState() =>
      _TaskDetailScreenState(); // Use ConsumerState
}

class _TaskDetailScreenState extends ConsumerState<TaskDetailScreen> {
  // Extend ConsumerState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) => const Text('Task detail screen'),
        ),
        actions: [
          PopupMenuButton<ThemeMode>(
            onSelected: (themeMode) {
              ref
                  .read(themeProvider.notifier)
                  .setTheme(themeMode); // Use ref from ConsumerState
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
          ),
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Task detail',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 20), // Add spacing between text and buttons

            ElevatedButton(
              onPressed: () {
                context.pop(); // Navigate back with reverse transition
              },
              child: const Text('Go back'),
            ),
          ]),
        ),
      ),
    );
  }
}
