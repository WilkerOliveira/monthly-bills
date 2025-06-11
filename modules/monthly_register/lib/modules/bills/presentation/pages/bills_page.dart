import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/core/translation/register_strings.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/filter_widget_cubit.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/list_bills_cubit.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/list_bills_state.dart';
import 'package:monthly_ui_components/filters/date_range_filter_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  late RegisterStrings strings;
  late FilterWidgetCubit filterWidgetCubit;
  late ListBillsCubit listBillsCubit;
  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<RegisterStrings>();
    filterWidgetCubit = MonthlyDI.I.get<FilterWidgetCubit>();
    listBillsCubit = MonthlyDI.I.get<ListBillsCubit>();
  }

  @override
  void dispose() {
    filterWidgetCubit.close();
    listBillsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.listBillsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            onPressed: () {
              filterWidgetCubit.showFilter();
            },
          ),
        ],
      ),

      body: BasePage(
        child: Stack(
          children: [
            BlocBuilder<ListBillsCubit, ListBillsState>(
              bloc: listBillsCubit,
              builder: (context, state) {
                switch (state) {
                  case ListBillsInitialState():
                    return const SizedBox.shrink();
                  case ListBillsLoadingState():
                    return const Center(child: LoadingStateWidget());
                  case ListBillsLoadedState():
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.bills.length,
                      itemBuilder: (context, index) {
                        return BillCard(bill: state.bills[index]);
                      },
                    );
                  case ListBillsErrorState():
                    return ErrorStateWidget(message: strings.errorMessage);
                  case ListBillsEmpty():
                    return Center(
                      child: EmptyStateWidget(title: strings.noBillsMessage),
                    );
                }
              },
            ),
            BlocBuilder<FilterWidgetCubit, FilterWidgetState>(
              bloc: filterWidgetCubit,
              builder: (context, state) {
                return Visibility(
                  visible: state.showFilter,
                  child: DateRangeFilterWidget(
                    onFilter: (DateTime startDate, DateTime endDate) {
                      filterWidgetCubit.showFilter();
                      listBillsCubit.fetchBills(startDate, endDate);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
