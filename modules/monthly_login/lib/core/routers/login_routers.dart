import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/presentation/pages/login_page.dart';

abstract class LoginRoutersPath {
  static const login = '/auth/login';
}

final List<RouteBase> loginRoutes = <RouteBase>[
  GoRoute(
    path: LoginRoutersPath.login,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginPage();
    },
  ),
];
