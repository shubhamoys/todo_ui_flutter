class RegistrationParams {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const RegistrationParams({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
