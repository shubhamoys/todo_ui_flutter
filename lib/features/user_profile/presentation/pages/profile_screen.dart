import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/theme/colors/app_colors.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';
import 'package:todo_ui_flutter/core/utils/auth_utils.dart';
import 'package:todo_ui_flutter/core/widgets/action_rows/profile_action_row.dart';
import 'package:todo_ui_flutter/core/widgets/dialogs/app_confirmation_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AppConfirmationDialog(
        confirmationText: 'Are you sure you want to logout?',
        confirmLabel: 'Logout',
        cancelLabel: 'Cancel',
        confirmColor: Theme.of(context).colorScheme.error,
        cancelColor: Theme.of(context).colorScheme.primary,
        onConfirm: () async {
          Navigator.of(context).pop(); // Close the dialog
          await AuthUtils.logout();
          if (context.mounted) {
            context.go('/login');
          }
        },
        onCancel: () {
          Navigator.of(context).pop(); // Just close the dialog
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now, use a placeholder name
    const userName = 'John Doe';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              Center(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child:
                      const Icon(Icons.person, size: 56, color: Colors.white),
                ),
              ),

              const SizedBox(height: AppSpacing.s),

              // User name
              Text(
                userName,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.xl),

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
                icon: Icons.settings,
                label: 'App settings',
                onTap: () {
                  context.push('/settings');
                },
              ),

              const SizedBox(height: AppSpacing.m),

              // Account section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              // Account Details
              ProfileActionRow(
                icon: Icons.person,
                label: 'Change account details',
                onTap: () {
                  // To be implemented
                },
              ),

              const SizedBox(height: AppSpacing.s),

              // Account Password
              ProfileActionRow(
                icon: Icons.key,
                label: 'Change account password',
                onTap: () {
                  // To be implemented
                },
              ),

              const SizedBox(height: AppSpacing.s),

              // Change Profile Image
              ProfileActionRow(
                icon: Icons.camera_alt,
                label: 'Change account image',
                onTap: () {
                  // To be implemented
                },
              ),

              const SizedBox(height: AppSpacing.m),

              // About App section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'UpDoTo',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              // Account Details
              ProfileActionRow(
                icon: Icons.info_outline,
                label: 'About us',
                onTap: () {
                  // To be implemented
                },
              ),

              const SizedBox(height: AppSpacing.s),

              // Account Password
              ProfileActionRow(
                icon: Icons.help_outline,
                label: 'Help & Feedback',
                onTap: () {
                  // To be implemented
                },
              ),

              // Logout
              const SizedBox(height: AppSpacing.m),

              ProfileActionRow(
                icon: Icons.logout,
                label: 'Logout',
                color: AppColors.error, // Use your error color
                onTap: () => _handleLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
