import 'package:flutter_shop/auth/models/user_model.dart';

class AuthStorage {
  static final AuthStorage _instance = AuthStorage._internal();
  factory AuthStorage() => _instance;
  AuthStorage._internal();

  String? accessToken;
  UserModel? currentUser;
}
