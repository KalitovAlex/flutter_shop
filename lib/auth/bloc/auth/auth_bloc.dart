import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_shop/auth/models/auth_model.dart';
import 'package:flutter_shop/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc({required AuthRepository repository})
      : _repository = repository,
        super(const AuthState.initial()) {
    on<AuthSignInRequested>(_onSignInRequested);
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final accessToken = await _repository.signIn(
        AuthRequest(email: event.email, password: event.password),
      );

      if (accessToken != null) {
        emit(AuthState.success(accessToken));
      } else {
        emit(const AuthState.error('Неверный email или пароль'));
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
