class ApiRoutes {
  ApiRoutes._(); // Private constructor to prevent instantiation

  // Auth Routes
  static const String login = '/users/login';
  static const String register = '/users/register';
  static const String forgotPassword = '/users/forgot-password';

  // Task Routes
  static const String tasks = '/tasks';
  static const String taskById = '/tasks/'; // Append task ID when using

  // User Routes
  static const String profile = '/users/profile';
  static const String updateProfile = '/users/update';
}
