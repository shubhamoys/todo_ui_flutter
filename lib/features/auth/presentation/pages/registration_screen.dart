import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/theme/colors/app_colors.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';
import 'package:todo_ui_flutter/core/widgets/buttons/app_primary_button.dart';
import 'package:todo_ui_flutter/core/widgets/input_fields/app_text_field.dart';
import 'package:todo_ui_flutter/core/widgets/snackbar/app_snackbar.dart';
import 'package:todo_ui_flutter/features/auth/presentation/providers/registration_provider.dart';

// Change StatefulWidget to ConsumerStatefulWidget
class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

// Change State to ConsumerState
class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Dismiss the keyboard before register
      FocusScope.of(context).unfocus();

      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      // Call Register through provider
      await ref
          .read(registrationProvider.notifier)
          .register(name, email, password, confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Watch registration state
    final registrationState = ref.watch(registrationProvider);

    // Listen to state changes
    ref.listen(registrationProvider, (previous, current) {
      if (current.isAuthenticated) {
        // Navigate to home on successful registration
        context.go('/');
      }
      if (current.errorMessage != null) {
        // Show error message
        AppSnackbar.showError(
          context,
          current.errorMessage!.replaceFirst('Exception: ', ''),
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const SizedBox(height: AppSpacing.xl),

                      // Header
                      Center(
                        child: Text(
                          'Welcome to Todo UI',
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      // Name Field
                      SizedBox(
                        width: double.infinity,
                        child: AppTextField(
                          controller: _nameController,
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.m),

                      // Email Field
                      SizedBox(
                        width: double.infinity,
                        child: AppTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          isEmail: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.m),

                      // Password Field
                      SizedBox(
                        width: double.infinity,
                        child: AppTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          isPassword: true,
                          isPasswordVisible: _isPasswordVisible,
                          onPasswordToggle: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.m),

                      // Confirm Password Field
                      SizedBox(
                        width: double.infinity,
                        child: AppTextField(
                          controller: _confirmPasswordController,
                          labelText: 'Confirm Password',
                          hintText: 'Enter your password again',
                          isPassword: true,
                          isPasswordVisible: _isConfirmPasswordVisible,
                          onPasswordToggle: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.l),

                      // Registration Button
                      Center(
                        child: AppPrimaryButton(
                          text: registrationState.isLoading
                              ? 'Registering...'
                              : 'Register',
                          onPressed:
                              registrationState.isLoading ? null : _submitForm,
                          backgroundColor: AppColors.primary,
                          textColor: AppColors.lightBackground,
                          isLoading: registrationState.isLoading,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.m,
                            vertical: AppSpacing.m,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.m),

                      // Login Prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: registrationState.isLoading
                                ? null
                                : () {
                                    context.go('/');
                                  },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
