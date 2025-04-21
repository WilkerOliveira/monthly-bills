import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/monthly/presentation/pages/monthly_page.dart';

abstract class ReportRoutersPath {
  static const monthlyReport = '/monthlyReport';
}

final List<RouteBase> reportRoutes = <RouteBase>[
  GoRoute(
    path: ReportRoutersPath.monthlyReport,
    builder: (BuildContext context, GoRouterState state) {
      return const MonthlyPage();
    },
  ),
];
