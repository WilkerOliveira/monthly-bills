import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_year/presentation/cubit/by_year_cubit.dart';
import 'package:monthly_report/modules/by_year/presentation/cubit/by_year_state.dart';
import 'package:monthly_report/modules/by_year/presentation/widgets/by_year_content.dart';
import 'package:monthly_report/modules/by_year/presentation/widgets/year_navigation_header.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByYearReportPage extends StatefulWidget {
  const ByYearReportPage({super.key});

  @override
  State<ByYearReportPage> createState() => _ByYearReportPageState();
}

class _ByYearReportPageState extends State<ByYearReportPage> {
  late PageController _pageController;
  static const int _initialPageOffset = 12000;
  late DateTime _currentReportDate;
  late ReportStrings strings;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<ReportStrings>();
    final now = DateTime.now();
    _currentReportDate = DateTime(now.year, now.month);
    _pageController = PageController(initialPage: _initialPageOffset);
  }

  DateTime _getDateForPageIndex(int pageIndex) {
    final now = DateTime.now();
    final yearDifference = pageIndex - _initialPageOffset;
    return DateTime(now.year + yearDifference);
  }

  void _loadReportForYear(BuildContext context, int year) {
    //TODO: Fix problem with closed cubit
    context.read<ByYearCubit>().getYearReport(year: year);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(strings.reportByYearTitle), centerTitle: true),
      body: BlocProvider<ByYearCubit>(
        create: (_) {
          final cubit =
              MonthlyDI.I.get<ByYearCubit>()
                ..getYearReport(year: _currentReportDate.year);

          return cubit;
        },
        child: BlocBuilder<ByYearCubit, ByYearState>(
          builder: (context, state) {
            return Column(
              children: [
                YearNavigationHeader(
                  pageController: _pageController,
                  strings: strings,
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
                      _loadReportForYear(context, _currentReportDate.year);
                    },
                    itemBuilder: (context, pageIndex) {
                      final pageDate = _getDateForPageIndex(pageIndex);

                      if (state is ByYearLoadedState &&
                          state.yearReportEntity.year == pageDate.year) {
                        return ByYearContent(
                          report: state.yearReportEntity,
                          strings: strings,
                        );
                      } else if (state is ByYearLoadingState &&
                          _currentReportDate.year == pageDate.year) {
                        return const Center(child: LoadingStateWidget());
                      } else if (state is ByYearErrorState &&
                          _currentReportDate.year == pageDate.year) {
                        return const Center(child: ErrorStateWidget());
                      } else if (state is ByYearEmptyState &&
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
