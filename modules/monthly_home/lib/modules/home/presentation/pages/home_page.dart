import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_strings.dart';

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
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1C1C1E), // Cor de fundo base
                    Color(0xFF2E2E30), // Um tom ligeiramente mais claro
                    Color(0xFF3A3A3C), // Outro tom mais claro para o gradiente
                  ],
                  stops: [0.0, 0.5, 1.0], // Distribuição das cores no gradiente
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${strings.homeWelcome},',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            'Alex Johnson',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Summary cards
                  Row(
                    children: [
                      Expanded(
                        child: _SummaryCard(
                          icon: Icons.receipt,
                          value: '\$${totalAmount.toStringAsFixed(2)}',
                          label: strings.homeTotalDue,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _SummaryCard(
                          icon: Icons.calendar_today,
                          value: upcomingBills.toString(),
                          label: strings.homeUpcoming,
                          color: Colors.amber.shade200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Bills overview title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    strings.homeSubtitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      strings.homeSeeAll,
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                  ),
                ],
              ),
            ),

            // Bills list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _bills.length,
                itemBuilder: (context, index) {
                  return _BillCard(bill: _bills[index]);
                },
              ),
            ),

            // Empty state illustration (hidden when bills exist)
            if (_bills.isEmpty)
              Column(
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 200,
                    child: Lottie.asset(
                      'assets/animations/empty.json',
                      package: 'monthly_home',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    strings.homeNoBillsMessage,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    strings.homeAddFirstBill,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                ],
              ),
          ],
        ),
      ),

      // Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade800,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: color.withValues(alpha: 0.8))),
        ],
      ),
    );
  }
}

class _BillCard extends StatelessWidget {
  const _BillCard({required this.bill});
  final Bill bill;

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();

    final daysUntilDue = bill.dueDate.difference(DateTime.now()).inDays;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Bill icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(_getBillIcon(bill.name), color: Colors.blue.shade800),
            ),

            const SizedBox(width: 16),

            // Bill details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bill.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    strings.homeDueUntil.replace(
                      ['%s'],
                      [daysUntilDue.toString()],
                    ),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // Amount and pay button
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${bill.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(strings.homePay),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getBillIcon(String billName) {
    switch (billName.toLowerCase()) {
      case 'electricity':
        return Icons.bolt;
      case 'internet':
        return Icons.wifi;
      case 'rent':
        return Icons.home;
      case 'water':
        return Icons.water_drop;
      default:
        return Icons.receipt;
    }
  }
}

class Bill {
  Bill({required this.name, required this.amount, required this.dueDate});
  final String name;
  final double amount;
  final DateTime dueDate;
}
