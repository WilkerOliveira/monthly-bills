import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/modules/bills/presentation/pages/bills_page.dart';

abstract class RegisterRoutersPath {
  static const bills = '/bills';
}

final List<RouteBase> registerRoutes = <RouteBase>[
  GoRoute(
    path: RegisterRoutersPath.bills,
    builder: (BuildContext context, GoRouterState state) {
      return const BillsPage();
    },
  ),
];
