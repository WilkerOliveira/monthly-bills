import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/modules/home/presentation/pages/home_page.dart';

abstract class HomeRoutersPath {}

final List<RouteBase> homeRoutes = <RouteBase>[
  GoRoute(
    name: MainRoutes.home,
    path: MainRoutes.home,
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
  ),
];
