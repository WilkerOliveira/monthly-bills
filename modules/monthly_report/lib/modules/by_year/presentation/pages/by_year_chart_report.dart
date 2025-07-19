import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_year/domain/entities/month_year_report_entity.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByYearChartReport extends StatefulWidget {
  const ByYearChartReport({required this.data, super.key});
  final List<MonthYearReportEntity> data;

  @override
  State<ByYearChartReport> createState() => _ByYearChartReportState();
}

class _ByYearChartReportState extends State<ByYearChartReport> {
  late ReportStrings strings;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<ReportStrings>();
  }

  @override
  Widget build(BuildContext context) {
    final series = <charts.Series<MonthYearReportEntity, String>>[
      charts.Series<MonthYearReportEntity, String>(
        id: 'Monthly Report',
        domainFn:
            (MonthYearReportEntity report, _) => _getMonthName(report.month),
        measureFn: (MonthYearReportEntity report, _) => report.total,
        data: widget.data,
        labelAccessorFn:
            (MonthYearReportEntity report, _) =>
                report.total.formatToCurrency(strings.locale),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];
    final chartWidth = widget.data.length * 100.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.reportByYearTitle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
        body: BasePage(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width:
                  chartWidth < MediaQuery.of(context).size.width
                      ? MediaQuery.of(context).size.width
                      : chartWidth,
              child: charts.BarChart(
                series,
                animate: true,
                barRendererDecorator: charts.BarLabelDecorator<String>(
                  outsideLabelStyleSpec: const charts.TextStyleSpec(
                    fontSize: 12,
                    color: charts.Color.white,
                  ),
                  insideLabelStyleSpec: const charts.TextStyleSpec(
                    fontSize: 10,
                    color: charts.Color.white,
                  ),
                ),
                behaviors: [
                  charts.SlidingViewport(),
                  charts.PanAndZoomBehavior(),
                ],
                domainAxis: charts.OrdinalAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                    labelRotation: 0,
                    labelStyle: const charts.TextStyleSpec(
                      fontSize: 12,
                      color: charts.MaterialPalette.white,
                    ),
                    lineStyle: charts.LineStyleSpec(
                      color: charts.MaterialPalette.blue.shadeDefault,
                    ),
                  ),
                  viewport: charts.OrdinalViewport(
                    _getMonthName(widget.data.first.month),
                    6,
                  ),
                ),
                primaryMeasureAxis: charts.NumericAxisSpec(
                  tickProviderSpec: const charts.BasicNumericTickProviderSpec(
                    desiredMinTickCount: 5,
                    desiredMaxTickCount: 10,
                  ),
                  renderSpec: charts.GridlineRendererSpec(
                    labelStyle: const charts.TextStyleSpec(
                      fontSize: 10,
                      color: charts.MaterialPalette.white,
                    ),
                    lineStyle: charts.LineStyleSpec(
                      color: charts.MaterialPalette.green.shadeDefault,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to convert month number to name
  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
