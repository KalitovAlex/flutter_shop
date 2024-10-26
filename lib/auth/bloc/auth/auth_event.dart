part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = AuthSignInRequested;
}
