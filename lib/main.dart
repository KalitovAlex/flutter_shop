import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_shop/auth/repository/auth_repository.dart';
import 'package:flutter_shop/auth/service/auth_service.dart';
import 'package:flutter_shop/core/router/router.dart';
import 'package:flutter_shop/core/style/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'home/repository/concert_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authService = AuthService();
  await authService.init();

  try {
    await dotenv.load(fileName: ".env.local");
  } catch (e) {
    debugPrint('Error loading .env.local: $e');
    dotenv.env['API_URL'] =
        'http://merch-backend-cb3890-69d455-194-87-131-174.traefik.me/api';
  }

  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  final _appRouter = AppRouter();
  final _dio = Dio(BaseOptions(
    baseUrl:
        'http://merch-backend-cb3890-69d455-194-87-131-174.traefik.me/api', // Замените на ваш базовый URL
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  MyApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MultiProvider(
      providers: [
        Provider<ConcertRepository>(
          create: (context) => ConcertRepository(_dio),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: _appRouter.config(
            deepLinkBuilder: (deepLink) async {
              final authRepository = AuthRepository(authService: authService);
              final isAuthenticated = await authRepository.refresh();

              if (isAuthenticated) {
                return DeepLink([const HomeRoute()]);
              }
              return DeepLink([const AuthRoute()]);
            },
          ),
        );
      }),
    );
  }
}
