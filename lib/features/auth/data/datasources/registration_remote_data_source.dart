import 'dart:convert';

import 'package:todo_ui_flutter/config/routes/api_routes.dart';
import 'package:todo_ui_flutter/core/http/http_client.dart';
import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/registration_params.dart';

class RegistrationRemoteDataSource {
  final HttpClient _client;

  RegistrationRemoteDataSource(this._client);

  Future<AuthResponseModel> register(RegistrationParams params) async {
    try {
      final response = await _client.post(
        Uri.parse('${_client.baseUrl}${ApiRoutes.register}'),
        body: jsonEncode({
          'name': params.name,
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
      throw Exception('Registration failed: $e');
    }
  }
}
