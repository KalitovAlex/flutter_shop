abstract class ProfileState {
  final bool isEditing;
  const ProfileState({required this.isEditing});
}

class ProfileInitial extends ProfileState {
  const ProfileInitial() : super(isEditing: false);
}

class ProfileEditing extends ProfileState {
  const ProfileEditing() : super(isEditing: true);
}

class ProfileUpdateSuccess extends ProfileState {
  const ProfileUpdateSuccess() : super(isEditing: false);
}

class ProfileUpdateFailure extends ProfileState {
  final String error;
  const ProfileUpdateFailure(this.error) : super(isEditing: true);
}
