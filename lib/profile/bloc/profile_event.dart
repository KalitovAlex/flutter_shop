abstract class ProfileEvent {}

class EditProfileStarted extends ProfileEvent {}

class EditProfileCancelled extends ProfileEvent {}

class ProfileUpdateRequested extends ProfileEvent {
  final String email;
  final String password;
  ProfileUpdateRequested({required this.email, required this.password});
}
