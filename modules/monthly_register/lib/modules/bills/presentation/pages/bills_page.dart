import 'package:flutter/material.dart';
import 'package:monthly_domain/monthly_domain.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  final List<BillEntity> _bills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bills')),
      body: ListView.builder(
        itemCount: _bills.length,
        itemBuilder: (context, index) {
          final bill = _bills[index];
          return ListTile(
            title: Text(bill.name),
            subtitle: Text(bill.amount.toString()),
          );
        },
      ),
    );
  }
}
