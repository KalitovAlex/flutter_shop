import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/core/storage/auth_storage.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB71C1C),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: Container(
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
        child: Center(
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
                        leading: const Icon(Icons.email, color: Colors.white),
                        title: const Text(
                          'Email',
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Text(
                          currentUser.email,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock, color: Colors.white),
                        title: const Text(
                          'Пароль',
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Text(
                          '********',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today, color: Colors.white),
                        title: const Text(
                          'Дата регистрации',
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Text(
                          _formatDate(currentUser.createdAt),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Н/Д';
    return '${date.day}.${date.month}.${date.year}';
  }
}
