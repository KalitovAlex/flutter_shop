import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/auth/screen/auth.dart';
import 'package:flutter_shop/auth/screen/register.dart';
import 'package:flutter_shop/cart/screen/cart_screen.dart';
import 'package:flutter_shop/core/router/routes.dart';
import 'package:flutter_shop/home/screen/home_screen.dart';
import 'package:flutter_shop/profile/screen/profile_screen.dart';
import 'package:flutter_shop/concert/screen/concert_detail_screen.dart';
import 'package:flutter_shop/home/models/concert_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
          path: authRoute,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: homeRoute,
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: registerRoute,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: profileRoute,
        ),
        AutoRoute(
          page: CartRoute.page,
          path: cartRoute,
        ),
        AutoRoute(
          page: ConcertDetailRoute.page,
          path: '/concert-detail',
        ),
      ];
}
