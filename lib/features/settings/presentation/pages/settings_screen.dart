import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';
import 'package:todo_ui_flutter/core/theme/theme_provider.dart';
import 'package:todo_ui_flutter/core/widgets/action_rows/profile_action_row.dart';
import 'package:todo_ui_flutter/features/settings/presentation/widgets/theme_selection_dialog.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: AppSpacing.l),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Settings section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              ProfileActionRow(
                icon: Icons.color_lens,
                label: 'Change app theme',
                onTap: () {
                  final currentTheme = ref.read(themeProvider);
                  showDialog(
                    context: context,
                    builder: (context) => ThemeSelectionDialog(
                      initialThemeMode: currentTheme,
                      onCancel: () => Navigator.of(context).pop(),
                      onConfirm: (selectedTheme) {
                        ref
                            .read(themeProvider.notifier)
                            .setTheme(selectedTheme);
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
