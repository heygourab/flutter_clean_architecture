import 'package:flutter_clean_architecture/features/auth/data/models/user_model.dart';

/// Template for Remote Data Source in Clean Architecture
/// 
/// This interface defines the contract for remote data operations.
/// Implementations might use REST API, GraphQL, Firebase, etc.
abstract class IAuthRemoteDataSource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();
}