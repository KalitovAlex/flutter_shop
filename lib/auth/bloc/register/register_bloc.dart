import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/auth/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repository;

  RegisterBloc({required this.repository}) : super(const RegisterState.initial()) {
    on<_SignUpRequested>((event, emit) async {
      emit(const RegisterState.loading());
      try {
        final token = await repository.signUp(
          email: event.email,
          password: event.password,
        );
        emit(RegisterState.success(token));
      } catch (e) {
        emit(RegisterState.error(e.toString()));
      }
    });
  }
}
