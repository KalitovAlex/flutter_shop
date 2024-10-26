import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;

  ProfileBloc({required ProfileRepository repository})
      : _repository = repository,
        super(const ProfileInitial()) {
    on<EditProfileStarted>((event, emit) {
      emit(const ProfileEditing());
    });

    on<EditProfileCancelled>((event, emit) {
      emit(const ProfileInitial());
    });

    on<ProfileUpdateRequested>((event, emit) async {
      try {
        await _repository.updateProfile(
          email: event.email,
          password: event.password,
        );
        emit(const ProfileUpdateSuccess());
      } catch (e) {
        emit(ProfileUpdateFailure(e.toString()));
      }
    });
  }
}
