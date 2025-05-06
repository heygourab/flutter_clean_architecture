import 'package:flutter_clean_architecture/features/auth/data/models/user_model.dart';

/// Interface for local data operations using SharedPreferences or Hive
abstract class IAuthLocalDataSource {
  /// Caches the user data locally
  Future<void> cacheUser(UserModel user);

  /// Gets the cached user data
  Future<UserModel?> getCachedUser();

  /// Clears cached user data
  Future<void> clearCache();
}
