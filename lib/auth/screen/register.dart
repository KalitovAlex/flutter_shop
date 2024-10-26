import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/auth/bloc/register/register_bloc.dart';
import 'package:flutter_shop/auth/repository/auth_repository.dart';
import 'package:flutter_shop/auth/widgets/password_text_field.dart';
import 'package:flutter_shop/core/router/router.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(repository: AuthRepository()),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (token) {
              context.router.replace(const HomeRoute());
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
          );
        },
        child: Center(
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 25.h),
                        const Text(
                          'Регистрация',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Пожалуйста, введите email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        PasswordTextField(
                          controller: _passwordController,
                          labelText: 'Пароль',
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Пожалуйста, введите пароль';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              orElse: () => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<RegisterBloc>().add(
                                          RegisterEvent.signUpRequested(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                },
                                child: const Text(
                                  'Зарегистрироваться',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () =>
                              context.router.replace(const AuthRoute()),
                          child: const Text(
                            'Уже есть аккаунт? Войти',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
