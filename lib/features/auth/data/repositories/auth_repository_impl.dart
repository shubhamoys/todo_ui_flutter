import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_ui_flutter/core/constants/storage_keys.dart';
import 'package:todo_ui_flutter/features/auth/data/datasources/login_remote_data_source.dart';
import 'package:todo_ui_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:todo_ui_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_ui_flutter/features/auth/domain/params/login_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final SharedPreferences _prefs;

  // static const String _tokenKey = 'auth_token';

  AuthRepositoryImpl(this._loginRemoteDataSource, this._prefs);

  @override
  Future<AuthResponseModel> login(LoginParams params) async {
    return await _loginRemoteDataSource.login(params);
  }

  @override
  Future<bool> saveToken(String token) async {
    return await _prefs.setString(StorageKeys.authToken, token);
  }

  @override
  Future<String?> getToken() async {
    return _prefs.getString(StorageKeys.authToken);
  }

  @override
  Future<bool> removeToken() async {
    return await _prefs.remove(StorageKeys.authToken);
  }
}
