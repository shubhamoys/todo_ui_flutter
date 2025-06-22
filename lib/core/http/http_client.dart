import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_ui_flutter/config/env/environment_config.dart';
import 'package:todo_ui_flutter/core/constants/storage_keys.dart';

class HttpClient extends http.BaseClient {
  final http.Client _client = http.Client();
  final SharedPreferences _prefs;
  final String baseUrl = EnvironmentConfig.apiBaseUrl;

  HttpClient(this._prefs);

  Future<String?> _getAuthToken() async {
    return _prefs.getString(StorageKeys.authToken);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Add common headers
    request.headers.addAll({
      'Content-Type': 'application/json',
    });

    // Add auth token if available
    final token = await _getAuthToken();
    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    return _client.send(request);
  }

  // Helper methods for common HTTP operations
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    final finalHeaders = await _prepareHeaders(headers);
    return _client.get(url, headers: finalHeaders);
  }

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final finalHeaders = await _prepareHeaders(headers);
    return _client.post(url,
        headers: finalHeaders, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final finalHeaders = await _prepareHeaders(headers);
    return _client.put(url,
        headers: finalHeaders, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final finalHeaders = await _prepareHeaders(headers);
    return _client.delete(
      url,
      headers: finalHeaders,
      body: body,
      encoding: encoding,
    );
  }

  Future<Map<String, String>> _prepareHeaders(
      Map<String, String>? headers) async {
    final Map<String, String> finalHeaders = {
      'Content-Type': 'application/json',
    };

    final token = await _getAuthToken();
    if (token != null && token.isNotEmpty) {
      finalHeaders['Authorization'] = 'Bearer $token';
    }

    if (headers != null) {
      finalHeaders.addAll(headers);
    }

    return finalHeaders;
  }

  void dispose() {
    _client.close();
  }
}
