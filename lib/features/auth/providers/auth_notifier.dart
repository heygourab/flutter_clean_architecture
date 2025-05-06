import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/user.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error(String message) = _Error;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._repository) : super(const AuthState.initial()) {
    checkAuthStatus();
  }
  final IAuthRepository _repository;

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();
    final userOption = await _repository.getCurrentUser();
    state = userOption.fold(
      () => const AuthState.unauthenticated(),
      AuthState.authenticated,
    );
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthState.loading();
    final result = await _repository.signIn(
      email: email,
      password: password,
    );
    state = result.fold(
      (failure) => AuthState.error(failure.toString()),
      AuthState.authenticated,
    );
  }

  Future<void> signUp(String email, String password, String name) async {
    state = const AuthState.loading();
    final result = await _repository.signUp(
      email: email,
      password: password,
      name: name,
    );
    state = result.fold(
      (failure) => AuthState.error(failure.toString()),
      AuthState.authenticated,
    );
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    final result = await _repository.signOut();
    result.fold(
      (failure) => state = AuthState.error(failure.toString()),
      (_) => state = const AuthState.unauthenticated(),
    );
  }
}
