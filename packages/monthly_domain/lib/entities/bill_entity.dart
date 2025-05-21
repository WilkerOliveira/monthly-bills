import 'package:monthly_dependencies/monthly_dependencies.dart';

class BillEntity extends Equatable {
  const BillEntity({
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.paid,
    this.extraInfo,
    this.paymentDate,
    this.id,
  });

  final int? id;
  final String name;
  final double amount;
  final DateTime dueDate;
  final String? extraInfo;
  final bool paid;
  final DateTime? paymentDate;

  @override
  List<Object?> get props => [
    id,
    name,
    amount,
    dueDate,
    extraInfo,
    paid,
    paymentDate,
  ];
}
