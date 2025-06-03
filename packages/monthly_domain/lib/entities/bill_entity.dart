import 'package:monthly_dependencies/monthly_dependencies.dart';

class BillEntity extends Equatable {
  const BillEntity({
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.paid,
    required this.category,
    this.extraInfo,
    this.paymentDate,
    this.id,
  });

  factory BillEntity.empty() {
    return BillEntity(
      name: '',
      amount: 0,
      dueDate: DateTime.now(),
      paid: false,
      category: '',
    );
  }

  final int? id;
  final String name;
  final String category;
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
    category,
  ];

  BillEntity copyWith({
    int? id,
    String? name,
    String? category,
    double? amount,
    DateTime? dueDate,
    String? extraInfo,
    bool? paid,
    DateTime? paymentDate,
  }) {
    return BillEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      extraInfo: extraInfo ?? this.extraInfo,
      paid: paid ?? this.paid,
      paymentDate: paymentDate ?? this.paymentDate,
    );
  }
}
