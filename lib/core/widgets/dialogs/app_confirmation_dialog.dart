import 'package:flutter/material.dart';
import 'package:todo_ui_flutter/core/widgets/buttons/app_outline_button.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';
import 'package:todo_ui_flutter/core/widgets/buttons/app_primary_button.dart';

class AppConfirmationDialog extends StatelessWidget {
  final String confirmationText;
  final String confirmLabel;
  final String cancelLabel;
  final Color confirmColor;
  final Color cancelColor;
  final Color confirmLabelColor;
  final Color cancelLabelColor;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const AppConfirmationDialog({
    super.key,
    required this.confirmationText,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.confirmColor,
    required this.cancelColor,
    required this.confirmLabelColor,
    required this.cancelLabelColor,
    required this.onConfirm,
    required this.onCancel,
  });

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
              confirmationText,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.l),
            Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    text: cancelLabel,
                    onPressed: onCancel,
                    borderColor: cancelColor,
                    textColor: cancelLabelColor,
                  ),
                ),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: AppFillButton(
                    text: confirmLabel,
                    onPressed: onConfirm,
                    backgroundColor: confirmColor,
                    textColor: confirmLabelColor,
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
