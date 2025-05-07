import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/auth_failure.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

/// Template Repository Implementation
///
/// Shows how to:
/// 1. Handle errors and map them to domain failures
/// 2. Map data models to domain entities
/// 3. Coordinate between multiple data sources if needed
class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);
  final IAuthRemoteDataSource _remoteDataSource;
  final IAuthLocalDataSource _localDataSource;

  @override
  Future<Either<AuthFailure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      // Cache user data after successful sign in
      await _localDataSource.cacheUser(userModel);
      return right(userModel.toDomain());
    } catch (e) {
      // Template for error handling
      if (e.toString().contains('invalid-credentials')) {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }
      if (e.toString().contains('network')) {
        return left(const AuthFailure.networkError());
      }
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, User>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userModel = await _remoteDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );
      // Cache user data after successful sign up
      await _localDataSource.cacheUser(userModel);
      return right(userModel.toDomain());
    } catch (e) {
      if (e.toString().contains('email-already-in-use')) {
        return left(const AuthFailure.emailAlreadyInUse());
      }
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      await _localDataSource.clearCache();
      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final localUser = await _localDataSource.getCachedUser();
    if (localUser != null) {
      return true;
    }
    final remoteUser = await _remoteDataSource.getCurrentUser();
    if (remoteUser != null) {
      await _localDataSource.cacheUser(remoteUser);
      return true;
    }
    return false;
  }

  @override
  Future<Option<User>> getCurrentUser() async {
    try {
      // First try to get from local cache
      final localUser = await _localDataSource.getCachedUser();
      if (localUser != null) {
        return some(localUser.toDomain());
      }

      // If not in cache, try remote
      final remoteUser = await _remoteDataSource.getCurrentUser();
      if (remoteUser != null) {
        await _localDataSource.cacheUser(remoteUser);
        return some(remoteUser.toDomain());
      }

      return none();
    } catch (_) {
      return none();
    }
  }
}
