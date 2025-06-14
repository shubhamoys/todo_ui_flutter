import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/theme/colors/app_colors.dart';
import 'package:todo_ui_flutter/core/theme/spacing/app_spacing.dart';
import 'package:todo_ui_flutter/core/widgets/buttons/app_primary_button.dart';
import 'package:todo_ui_flutter/core/widgets/input_fields/app_text_field.dart';
import 'package:todo_ui_flutter/core/widgets/snackbar/app_snackbar.dart';
import 'package:todo_ui_flutter/features/auth/presentation/providers/login_provider.dart';

// Change StatefulWidget to ConsumerStatefulWidget
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

// Change State to ConsumerState
class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Dismiss the keyboard before login
      FocusScope.of(context).unfocus();

      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Call login through provider
      await ref.read(loginProvider.notifier).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Watch login state
    final loginState = ref.watch(loginProvider);

    // Listen to state changes
    ref.listen(loginProvider, (previous, current) {
      if (current.isAuthenticated) {
        // Navigate to home on successful login
        context.go('/');
      }
      if (current.errorMessage != null) {
        // Show error message
        AppSnackbar.showError(context, current.errorMessage!);
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
                          'Welcome Back',
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),

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
                      const SizedBox(height: AppSpacing.l),

                      // Login Button
                      Center(
                        child: AppPrimaryButton(
                          text:
                              loginState.isLoading ? 'Logging in...' : 'Login',
                          onPressed: loginState.isLoading ? null : _submitForm,
                          backgroundColor: AppColors.primary,
                          textColor: AppColors.lightBackground,
                          isLoading: loginState.isLoading,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.m,
                            vertical: AppSpacing.m,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.m),

                      // Forgot Password
                      TextButton(
                        onPressed: loginState.isLoading ? null : () {},
                        child: const Text('Forgot Password?'),
                      ),
                      const SizedBox(height: AppSpacing.m),

                      // Registration Prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: loginState.isLoading
                                ? null
                                : () {
                                    // Navigate to Registration Screen
                                  },
                            child: const Text('Register'),
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
