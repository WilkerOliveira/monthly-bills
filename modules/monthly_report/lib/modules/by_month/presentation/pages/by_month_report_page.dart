import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_month/presentation/cubit/by_month_cubit.dart';
import 'package:monthly_report/modules/by_month/presentation/cubit/by_month_state.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/by_month_content.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/month_navigation_header.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByMonthReportPage extends StatefulWidget {
  const ByMonthReportPage({super.key, this.initialDate});

  final DateTime? initialDate;

  @override
  State<ByMonthReportPage> createState() => _ByMonthReportPageState();
}

class _ByMonthReportPageState extends State<ByMonthReportPage> {
  late PageController _pageController;
  static const int _initialPageOffset = 12000;
  late DateTime _currentReportDate;
  late ReportStrings strings;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<ReportStrings>();
    final now = DateTime.now();
    _currentReportDate =
        widget.initialDate == null
            ? DateTime(now.year, now.month)
            : widget.initialDate!;

    if (widget.initialDate != null) {
      final diff =
          _currentReportDate.month -
          now.month +
          (_currentReportDate.year - now.year) * 12;
      _pageController = PageController(initialPage: _initialPageOffset + diff);
    } else {
      _pageController = PageController(initialPage: _initialPageOffset);
    }
  }

  DateTime _getDateForPageIndex(int pageIndex) {
    final now = DateTime.now();
    final monthDifference = pageIndex - _initialPageOffset;
    return DateTime(now.year, now.month + monthDifference);
  }

  void _loadReportForDate(BuildContext context, DateTime date) {
    //TODO: Fix problem with closed cubit
    context.read<ByMonthCubit>().getMonthlyReport(
      month: date.month,
      year: date.year,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _listenEvents(ByMonthCubit cubit, DateTime date) {
    MonthlyDI.I.get<MonthlyEventBus>().on<BillEvent>().listen((event) {
      cubit.getMonthlyReport(month: date.month, year: date.year);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.reportByMonthTitle),
        centerTitle: true,
      ),
      body: BlocProvider<ByMonthCubit>(
        create: (_) {
          final cubit =
              MonthlyDI.I.get<ByMonthCubit>()..getMonthlyReport(
                month: _currentReportDate.month,
                year: _currentReportDate.year,
              );

          _listenEvents(cubit, _currentReportDate);

          return cubit;
        },
        child: BlocBuilder<ByMonthCubit, ByMonthState>(
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
                      _loadReportForDate(context, _currentReportDate);
                    },
                    itemBuilder: (context, pageIndex) {
                      final pageDate = _getDateForPageIndex(pageIndex);

                      if (state is ByMonthLoadedState &&
                          state.monthlyReport.month == pageDate.month &&
                          state.monthlyReport.year == pageDate.year) {
                        return ByMonthContent(
                          report: state.monthlyReport,
                          strings: strings,
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
      ),
    );
  }
}
