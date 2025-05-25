import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/core/translation/register_strings.dart';
import 'package:monthly_register/modules/bills/domain/usecases/get_bills_by_range_usecase.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/filter_widget_cubit.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/list_bills_cubit.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/list_bills_state.dart';
import 'package:monthly_ui_components/components/widgets/filters/date_range_filter_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  late RegisterStrings strings;
  late FilterWidgetCubit filterWidgetCubit;
  @override
  void initState() {
    strings = MonthlyDI.I.get<RegisterStrings>();
    filterWidgetCubit = MonthlyDI.I.get<FilterWidgetCubit>();
    super.initState();
  }

  @override
  void dispose() {
    filterWidgetCubit.close();
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

      body: Stack(
        children: [
          BlocProvider(
            create:
                (context) => ListBillsCubit(
                  getBillsByRangeUsecase:
                      MonthlyDI.I.get<GetBillsByRangeUsecase>(),
                )..fetchBills(
                  DateTime(DateTime.now().year, DateTime.now().month),
                  DateTime.now(),
                ),
            child: Column(
              children: [
                BlocBuilder<ListBillsCubit, ListBillsState>(
                  builder: (context, state) {
                    switch (state) {
                      case ListBillsInitialState():
                      case ListBillsLoadingState():
                        return const LoadingStateWidget();
                      case ListBillsLoadedState():
                        return ListView.builder(
                          itemCount: state.bills.length,
                          itemBuilder: (context, index) {
                            final bill = state.bills[index];
                            return ListTile(
                              title: Text(bill.name),
                              subtitle: Text(bill.amount.toString()),
                            );
                          },
                        );
                      case ListBillsErrorState():
                        return ErrorStateWidget(message: strings.errorMessage);
                      case ListBillsEmpty():
                        return Center(
                          child: EmptyStateWidget(
                            title: strings.noBillsMessage,
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<FilterWidgetCubit, FilterWidgetState>(
            bloc: filterWidgetCubit,
            builder: (context, state) {
              return Visibility(
                visible: state.showFilter,
                child: DateRangeFilterWidget(
                  onFilter: (DateTime startDate, DateTime endDate) {
                    filterWidgetCubit.showFilter();
                    context.read<ListBillsCubit>().fetchBills(
                      startDate,
                      endDate,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
