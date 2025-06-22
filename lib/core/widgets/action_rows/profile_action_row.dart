import 'package:flutter/material.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';

class ProfileActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? color;

  const ProfileActionRow({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconAndTextColor = color ?? Theme.of(context).iconTheme.color;
    return InkWell(
      // splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppSpacing.s),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
        child: Row(
          children: [
            Icon(icon, size: AppSpacing.l, color: iconAndTextColor),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: iconAndTextColor,
                    ),
              ),
            ),
            if (icon != Icons.logout)
              const Icon(Icons.chevron_right, size: AppSpacing.l),
          ],
        ),
      ),
    );
  }
}
