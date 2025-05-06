import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/auth_failure.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

/// Template for implementing a use case in Clean Architecture
///
/// This demonstrates:
/// 1. Single Responsibility Principle
/// 2. Dependency Inversion (depends on IAuthRepository interface)
/// 3. Use of Either for error handling
class SignInUseCase {
  SignInUseCase(this._authRepository);
  final IAuthRepository _authRepository;

  /// Executes the sign in use case
  ///
  /// Shows how to:
  /// 1. Validate input parameters
  /// 2. Handle business logic
  /// 3. Return domain-specific results
  Future<Either<AuthFailure, User>> execute({
    required String email,
    required String password,
  }) async {
    // Example of input validation in use case
    if (email.isEmpty || !email.contains('@')) {
      return left(const AuthFailure.invalidEmailAndPasswordCombination());
    }

    if (password.length < 6) {
      return left(const AuthFailure.invalidEmailAndPasswordCombination());
    }

    // Delegate to repository after business rules are satisfied
    return _authRepository.signIn(
      email: email,
      password: password,
    );
  }
}
