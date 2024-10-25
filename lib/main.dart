import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/core/style/theme.dart';
import 'package:flutter_shop/home/screen/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 4,
          leading: Image.asset(
            'assets/logo.png',
            width: 40,
            height: 40,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ],
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
