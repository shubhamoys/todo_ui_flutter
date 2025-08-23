import 'package:flutter/material.dart';
import 'package:todo_ui_flutter/core/widgets/buttons/app_outline_button.dart';
import 'package:todo_ui_flutter/core/widgets/buttons/app_primary_button.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';

class ThemeSelectionDialog extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final VoidCallback onCancel;
  final void Function(ThemeMode) onConfirm;

  const ThemeSelectionDialog({
    super.key,
    required this.initialThemeMode,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  State<ThemeSelectionDialog> createState() => _ThemeSelectionDialogState();
}

class _ThemeSelectionDialogState extends State<ThemeSelectionDialog> {
  late ThemeMode _selectedTheme;

  @override
  void initState() {
    super.initState();
    _selectedTheme = widget.initialThemeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(AppSpacing.l),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose App Theme',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.m),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _selectedTheme,
              onChanged: (val) => setState(() => _selectedTheme = val!),
              title: const Text('System Default'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _selectedTheme,
              onChanged: (val) => setState(() => _selectedTheme = val!),
              title: const Text('Light Theme'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _selectedTheme,
              onChanged: (val) => setState(() => _selectedTheme = val!),
              title: const Text('Dark Theme'),
            ),
            const SizedBox(height: AppSpacing.m),
            Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    text: 'Cancel',
                    onPressed: widget.onCancel,
                    borderColor: Theme.of(context).colorScheme.error,
                    textColor: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: AppFillButton(
                    text: 'Confirm',
                    onPressed: () => widget.onConfirm(_selectedTheme),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
