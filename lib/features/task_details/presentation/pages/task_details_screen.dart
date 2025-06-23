import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: AppSpacing.l),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Builder(
          builder: (context) => const Text('Task detail screen'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) =>
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Task detail',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                  height: 20), // Add spacing between text and buttons

              ElevatedButton(
                onPressed: () {
                  context.pop(); // Navigate back with reverse transition
                },
                child: const Text('Go back'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
