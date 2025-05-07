import 'dart:convert';

import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements IAuthLocalDataSource {
  AuthLocalDataSourceImpl(this._prefs);
  static const String _cachedUserKey = 'CACHED_USER';

  final SharedPreferences _prefs;

  @override
  Future<void> cacheUser(UserModel user) async {
    await _prefs.setString(_cachedUserKey, json.encode(user.toJson()));
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final jsonString = _prefs.getString(_cachedUserKey);
    if (jsonString != null) {
      return UserModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> clearCache() async {
    await _prefs.remove(_cachedUserKey);
  }
}
