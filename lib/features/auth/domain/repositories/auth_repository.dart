import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/auth_failure.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/user.dart';

/// Template for Auth Repository interface following clean architecture
/// 
/// This interface defines the contract for authentication operations.
/// The actual implementation will be in the data layer.
abstract class IAuthRepository {
  /// Attempts to sign in a user
  /// 
  /// Returns Either a User entity on success or an AuthFailure on error
  Future<Either<AuthFailure, User>> signIn({
    required String email,
    required String password,
  });

  /// Attempts to sign up a new user
  Future<Either<AuthFailure, User>> signUp({
    required String email,
    required String password,
    required String name,
  });

  /// Signs out the current user
  Future<Either<AuthFailure, Unit>> signOut();

  /// Checks if user is currently authenticated
  Future<bool> isAuthenticated();

  /// Gets the current authenticated user
  Future<Option<User>> getCurrentUser();
}