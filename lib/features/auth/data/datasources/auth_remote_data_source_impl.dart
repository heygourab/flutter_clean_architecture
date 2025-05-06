import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/auth/data/models/user_model.dart';

/// Mock implementation of Remote Data Source for testing
/// Replace this with actual API implementation
class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  UserModel? _currentUser;

  @override
  Future<UserModel?> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    // Mock validation
    if (email != 'test@example.com' || password != 'password123') {
      throw Exception('invalid-credentials');
    }

    _currentUser = UserModel(
      id: '1',
      email: email,
      name: 'Test User',
    );
    return _currentUser!;
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    // Mock email already exists check
    if (email == 'test@example.com') {
      throw Exception('email-already-in-use');
    }

    _currentUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
    );
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
  }
}
