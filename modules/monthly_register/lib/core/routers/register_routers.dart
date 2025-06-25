import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bill/presentation/pages/bill_page.dart';

abstract class RegisterRoutersPath {
  static const bills = '/bills';
}

final List<RouteBase> registerRoutes = <RouteBase>[
  GoRoute(
    path: MainRoutes.newBill,
    builder: (BuildContext context, GoRouterState state) {
      final currentBill = state.extra as BillEntity?;
      return BillPage(currentBill: currentBill);
    },
  ),
];
