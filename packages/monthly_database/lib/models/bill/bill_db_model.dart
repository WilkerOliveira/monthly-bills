import 'package:isar/isar.dart';

part 'bill_db_model.g.dart';

@collection
class BillDbModel {
  BillDbModel({
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.extraInfo,
    required this.paid,
    required this.category,
    this.recurrences,
    this.paymentDate,
    this.recurrenceId,
    this.id,
  });

  final Id? id;
  final String name;
  final double amount;
  @Index()
  final DateTime dueDate;
  final String? extraInfo;
  final bool paid;
  final DateTime? paymentDate;
  final String category;
  final int? recurrences;
  final int? recurrenceId;

  @Index(composite: [CompositeIndex('dueDate', type: IndexType.value)])
  int get monthYear => dueDate.month + dueDate.year * 100;

  BillDbModel copyWith({
    Id? id,
    String? name,
    double? amount,
    DateTime? dueDate,
    String? extraInfo,
    bool? paid,
    DateTime? paymentDate,
    String? category,
    int? recurrences,
    int? recurrenceId,
  }) {
    return BillDbModel(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      extraInfo: extraInfo ?? this.extraInfo,
      paid: paid ?? this.paid,
      paymentDate: paymentDate ?? this.paymentDate,
      category: category ?? this.category,
      recurrences: recurrences ?? this.recurrences,
      recurrenceId: recurrenceId ?? this.recurrenceId,
    );
  }
}
