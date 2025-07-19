import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_month/presentation/pages/by_month_report_page.dart';
import 'package:monthly_report/modules/by_year/domain/entities/month_year_report_entity.dart';
import 'package:monthly_report/modules/by_year/presentation/pages/by_year_chart_report.dart';
import 'package:monthly_report/modules/by_year/presentation/pages/by_year_report_page.dart';

abstract class ReportRoutersPath {
  static String reportByMonth = '/byMonth';
  static String reportByYear = '/byYear';
  static String reportByYearChart = '/byYearChart';
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
  GoRoute(
    path: ReportRoutersPath.reportByYearChart,
    builder: (BuildContext context, GoRouterState state) {
      return ByYearChartReport(
        data: state.extra! as List<MonthYearReportEntity>,
      );
    },
  ),
];
