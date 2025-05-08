import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_cubit.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_state.dart';
import 'package:monthly_home/modules/home/presentation/widgets/bills/bills_list_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/profile/profile_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/states/empty_state_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/states/error_state_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/summary/summary_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStrings strings;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<HomeStrings>();
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
        body: BlocProvider(
          create: (context) => HomeCubit()..init(),
          child: BasePage(
            child: SingleChildScrollView(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  switch (state) {
                    case HomeLoadingState():
                      return const CircularProgressIndicator();
                    case HomeSuccessState():
                      return Column(
                        children: [
                          GradientBoxWidget(
                            child: Column(
                              children: [
                                const ProfileWidget(),
                                SizedBox(height: vMediumSpace),
                                SummaryWidget(
                                  totalAmount: state.bill.totalAmount,
                                  upcomingBills: state.bill.upcomingBills,
                                ),
                              ],
                            ),
                          ),
                          if (state.isEmpty)
                            const EmptyStateWidget()
                          else if (state.isError)
                            const ErrorStateWidget()
                          else
                            BillsListWidget(bills: state.bill.bills),
                        ],
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
