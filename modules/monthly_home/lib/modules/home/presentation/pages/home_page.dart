import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/presentation/widgets/bills/bills_list_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/profile/profile_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/states/empty_state_widget.dart';
import 'package:monthly_home/modules/home/presentation/widgets/summary/summary_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Bill> _bills = [
    Bill(
      name: 'Electricity',
      amount: 85.50,
      dueDate: DateTime.now().add(const Duration(days: 5)),
    ),
    Bill(
      name: 'Internet',
      amount: 59.99,
      dueDate: DateTime.now().add(const Duration(days: 12)),
    ),
    Bill(
      name: 'Rent',
      amount: 12.01,
      dueDate: DateTime.now().add(const Duration(days: 3)),
    ),
    Bill(
      name: 'Water',
      amount: 45.75,
      dueDate: DateTime.now().add(const Duration(days: 7)),
    ),
  ];

  late HomeStrings strings;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<HomeStrings>();
  }

  @override
  Widget build(BuildContext context) {
    const totalAmount = 50.6;
    final upcomingBills =
        _bills
            .where(
              (bill) => bill.dueDate.isBefore(
                DateTime.now().add(const Duration(days: 7)),
              ),
            )
            .length;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.homeTitle),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GradientBoxWidget(
              child: Column(
                children: [
                  const ProfileWidget(),
                  const SizedBox(height: 24),
                  SummaryWidget(
                    totalAmount: totalAmount,
                    upcomingBills: upcomingBills,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            BillsListWidget(bills: _bills),

            if (_bills.isEmpty) const EmptyStateWidget(),
          ],
        ),
      ),
    );
  }
}
