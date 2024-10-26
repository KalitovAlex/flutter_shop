import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_shop/auth/models/user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthRequest with _$AuthRequest {
  const factory AuthRequest({
    required String email,
    required String password,
  }) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    required String accessToken,
    required UserModel user,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}
