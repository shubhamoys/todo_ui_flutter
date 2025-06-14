import 'dart:convert';
import 'package:todo_ui_flutter/config/routes/api_routes.dart';
import 'package:todo_ui_flutter/core/http/http_client.dart';
import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/login_params.dart';

class LoginRemoteDataSource {
  final HttpClient _client;

  LoginRemoteDataSource(this._client);

  Future<AuthResponseModel> login(LoginParams params) async {
    try {
      final response = await _client.post(
        Uri.parse('${_client.baseUrl}${ApiRoutes.login}'),
        body: jsonEncode({
          'email': params.email,
          'password': params.password,
        }),
      );

      final authResponse =
          AuthResponseModel.fromJson(jsonDecode(response.body));
      return authResponse;
    } on FormatException {
      throw Exception('Invalid response format');
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
