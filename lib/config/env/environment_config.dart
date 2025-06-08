import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static final String apiBaseUrl =
      dotenv.env['API_BASE_URL'] ?? 'http://localhost';
  static final String port = dotenv.env['PORT'] ?? '8080';
  static final String appName = dotenv.env['APP_NAME'] ?? 'Unknown';
}
