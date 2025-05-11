import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User entity - Pure domain model
///
/// This is a template showing how to use Freezed for immutable domain entities
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
  }) = _User;
}
