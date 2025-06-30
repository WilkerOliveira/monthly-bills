import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/monthly/presentation/pages/report_page.dart';

final List<RouteBase> reportRoutes = <RouteBase>[
  GoRoute(
    path: MainRoutes.monthlyReport,
    builder: (BuildContext context, GoRouterState state) {
      return const ReportPage();
    },
  ),
];
