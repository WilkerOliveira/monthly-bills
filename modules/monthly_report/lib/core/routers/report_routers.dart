import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_month/presentation/pages/by_month_report_page.dart';
import 'package:monthly_report/modules/by_year/presentation/pages/by_year_report_page.dart';

abstract class ReportRoutersPath {
  static String reportByMonth = '/byMonth';
  static String reportByYear = '/byYear';
}

final List<RouteBase> reportRoutes = <RouteBase>[
  GoRoute(
    path: ReportRoutersPath.reportByMonth,
    builder: (BuildContext context, GoRouterState state) {
      return ByMonthReportPage(initialDate: state.extra as DateTime?);
    },
  ),
  GoRoute(
    path: ReportRoutersPath.reportByYear,
    builder: (BuildContext context, GoRouterState state) {
      return const ByYearReportPage();
    },
  ),
];
