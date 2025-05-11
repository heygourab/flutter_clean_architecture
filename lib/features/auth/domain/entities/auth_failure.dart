import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Authentication Failures
///
/// This is a template showing how to use Freezed for domain-specific failures
@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.networkError() = NetworkError;
}
