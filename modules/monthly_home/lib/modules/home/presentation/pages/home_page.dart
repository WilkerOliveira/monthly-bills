import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_cubit.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_state.dart';
import 'package:monthly_home/modules/home/presentation/widgets/bills/bills_list_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/profile/profile_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/summary/summary_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStrings strings;

  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<HomeStrings>();
    _cubit = MonthlyDI.I.get<HomeCubit>();
    _cubit.loadData(null);
    _listenEvents();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _listenEvents() {
    MonthlyDI.I.get<MonthlyEventBus>().on<AppConigUpdatedEvent>().listen((
      event,
    ) {
      _cubit.loadData(event.appConfig);
    });

    MonthlyDI.I.get<MonthlyEventBus>().on<BillEvent>().listen((event) {
      _cubit.loadData(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.homeTitle),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
        body: BasePage(
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: _cubit,
            builder: (context, state) {
              switch (state) {
                case HomeLoadingState():
                  return const LoadingStateWidget();
                case HomeSuccessState():
                  final bill = state.bill;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        GradientBoxWidget(
                          child: Column(
                            children: [
                              const ProfileWidget(),
                              SizedBox(height: vSmallSpace),
                              Text(
                                '${_formatDate(bill?.startDate)} '
                                '${strings.dueDateTo} '
                                '${_formatDate(bill?.endDate)}',
                                style: TextStyle(
                                  fontSize: subTitleTextSize,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.background,
                                ),
                              ),
                              SizedBox(height: vSmallSpace),
                              SummaryWidget(
                                totalAmount: bill?.totalAmount ?? 0,
                                upcomingBills: bill?.upcomingBills ?? 0,
                              ),
                            ],
                          ),
                        ),
                        if (state.isEmpty)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: defaultBottomSpace,
                            ),
                            child: EmptyStateWidget(
                              title: strings.homeNoBillsMessage,
                              message: strings.homeAddFirstBill,
                            ),
                          )
                        else if (state.isError)
                          ErrorStateWidget(message: strings.homeErrorMessage)
                        else
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: defaultBottomSpace,
                            ),
                            child: BillsListWidget(bills: bill!.bills),
                          ),
                      ],
                    ),
                  );
                case HomeErrorState():
                  return ErrorStateWidget(message: strings.homeLoading);
              }
            },
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return ' ';
    }
    return date.toDayAndMonthFormat(strings.locale);
  }
}
