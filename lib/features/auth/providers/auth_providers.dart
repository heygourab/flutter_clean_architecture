import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_local_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/features/auth/providers/auth_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Template for dependency injection with Riverpod
///
/// Shows how to:
/// 1. Set up a proper dependency tree
/// 2. Provide interfaces instead of implementations
/// 3. Make dependencies testable through overrides

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Should be overridden in main');
});

// Data Sources
final authLocalDataSourceProvider = Provider<IAuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl(ref.watch(sharedPreferencesProvider));
});

final authRemoteDataSourceProvider = Provider<IAuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl();
});

// Repositories
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  );
});

// State Management
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
