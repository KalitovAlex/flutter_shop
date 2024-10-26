import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/core/router/router.dart';
import 'package:flutter_shop/core/storage/auth_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/core/utils/format_date.dart';
import 'package:flutter_shop/auth/repository/auth_repository.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../repository/profile_repository.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        repository: ProfileRepository(),
      ),
      child: const _ProfileScreenContent(),
    );
  }
}

class _ProfileScreenContent extends StatefulWidget {
  const _ProfileScreenContent();

  @override
  State<_ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<_ProfileScreenContent> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
    final currentUser = AuthStorage().currentUser;
    if (currentUser != null) {
      _emailController.text = currentUser.email;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogout() async {
    await _authRepository.logout();
    if (mounted) {
      context.router.replaceAll([const AuthRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthStorage().currentUser;

    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('Пользователь не авторизован'),
        ),
      );
    }

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Профиль успешно обновлен')),
          );
        } else if (state is ProfileUpdateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Профиль',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: const Color(0xFFB71C1C),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.router.pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  state.isEditing ? Icons.check : Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (state.isEditing) {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Логин и пароль не могут быть пустыми')),
                      );
                      return;
                    }
                    context.read<ProfileBloc>().add(
                          ProfileUpdateRequested(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  } else {
                    context.read<ProfileBloc>().add(EditProfileStarted());
                  }
                },
              ),
            ],
          ),
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB71C1C),
                  Colors.black,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.white.withOpacity(0.1),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Информация пользователя',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            leading:
                                const Icon(Icons.email, color: Colors.white),
                            title: const Text(
                              'Email',
                              style: TextStyle(color: Colors.white70),
                            ),
                            subtitle: state.isEditing
                                ? TextField(
                                    controller: _emailController,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white70),
                                      ),
                                    ),
                                  )
                                : Text(
                                    currentUser.email,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.lock, color: Colors.white),
                            title: const Text(
                              'Пароль',
                              style: TextStyle(color: Colors.white70),
                            ),
                            subtitle: state.isEditing
                                ? TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'Введите новый пароль',
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white70),
                                      ),
                                    ),
                                  )
                                : const Text(
                                    '********',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.calendar_today,
                                color: Colors.white),
                            title: const Text(
                              'Дата регистрации',
                              style: TextStyle(color: Colors.white70),
                            ),
                            subtitle: Text(
                              formatDate(currentUser.createdAt),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: _handleLogout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Выйти',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
