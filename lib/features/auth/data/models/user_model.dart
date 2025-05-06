import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Example of a Data Transfer Object (DTO) in Clean Architecture
/// 
/// Demonstrates:
/// 1. JSON serialization
/// 2. Mapping between domain entity and data model
/// 3. Freezed usage for immutable data classes
@freezed
class UserModel with _$UserModel {

  // From Domain Entity
  factory UserModel.fromDomain(User user) => UserModel(
    id: user.id,
    email: user.email,
    name: user.name,
    photoUrl: user.photoUrl,
  );
  const UserModel._();  // Required for custom methods

  const factory UserModel({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserModel;

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => 
      _$UserModelFromJson(json);

  // To Domain Entity
  User toDomain() => User(
    id: id,
    email: email,
    name: name,
    photoUrl: photoUrl,
  );
}