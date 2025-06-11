import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_profile/modules/profile/presentation/pages/profile_page.dart';

abstract class ProfileRoutersPath {
  static const bills = '/profile';
}

final List<RouteBase> profileRoutes = <RouteBase>[
  GoRoute(
    path: MainRoutes.profile,
    builder: (BuildContext context, GoRouterState state) {
      return const ProfilePage();
    },
  ),
];
