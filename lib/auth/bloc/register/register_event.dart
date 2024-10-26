part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.signUpRequested({
    required String email,
    required String password,
  }) = _SignUpRequested;
}
