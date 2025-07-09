import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_month/presentation/cubit/by_month_cubit.dart';
import 'package:monthly_report/modules/by_month/presentation/cubit/by_month_state.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/by_month_content.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/month_navigation_header.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByMonthReportPage extends StatefulWidget {
  const ByMonthReportPage({super.key});

  @override
  State<ByMonthReportPage> createState() => _ByMonthReportPageState();
}

class _ByMonthReportPageState extends State<ByMonthReportPage> {
  late PageController _pageController;
  static const int _initialPageOffset = 12000;
  late DateTime _currentReportDate;
  late ReportStrings strings;
  late ByMonthCubit _byMonthCubit;

  @override
  void initState() {
    super.initState();
    _byMonthCubit = MonthlyDI.I.get<ByMonthCubit>();
    strings = MonthlyDI.I.get<ReportStrings>();
    final now = DateTime.now();
    _currentReportDate = DateTime(now.year, now.month);
    _pageController = PageController(initialPage: _initialPageOffset);

    _loadReportForDate(_currentReportDate);
  }

  DateTime _getDateForPageIndex(int pageIndex) {
    final now = DateTime.now();
    final monthDifference = pageIndex - _initialPageOffset;
    return DateTime(now.year, now.month + monthDifference);
  }

  void _loadReportForDate(DateTime date) {
    _byMonthCubit.getMonthlyReport(month: date.month, year: date.year);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _byMonthCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.reportByMonthTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<ByMonthCubit, ByMonthState>(
        bloc: _byMonthCubit,
        builder: (context, state) {
          return Column(
            children: [
              MonthNavigationHeader(
                pageController: _pageController,
                strings: strings,
                month: _currentReportDate.month,
                year: _currentReportDate.year,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _initialPageOffset * 2,
                  onPageChanged: (index) {
                    setState(() {
                      _currentReportDate = _getDateForPageIndex(index);
                    });
                    _loadReportForDate(_currentReportDate);
                  },
                  itemBuilder: (context, pageIndex) {
                    final pageDate = _getDateForPageIndex(pageIndex);

                    if (state is ByMonthLoadedState &&
                        state.monthlyReport.month == pageDate.month &&
                        state.monthlyReport.year == pageDate.year) {
                      return ByMonthContent(
                        report: state.monthlyReport,
                        strings: strings,
                        cubit: _byMonthCubit,
                      );
                    } else if (state is ByMonthLoadingState &&
                        _currentReportDate.month == pageDate.month &&
                        _currentReportDate.year == pageDate.year) {
                      return const Center(child: LoadingStateWidget());
                    } else if (state is ByMonthErrorState &&
                        _currentReportDate.month == pageDate.month &&
                        _currentReportDate.year == pageDate.year) {
                      return const Center(child: ErrorStateWidget());
                    } else if (state is ByMonthEmptyState &&
                        _currentReportDate.month == pageDate.month &&
                        _currentReportDate.year == pageDate.year) {
                      return Center(
                        child: EmptyStateWidget(title: strings.noBillsFound),
                      );
                    } else {
                      return const Center(child: LoadingStateWidget());
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
