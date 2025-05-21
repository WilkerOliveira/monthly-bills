import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';

class BillModel {
  BillModel({
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.paid,
    this.extraInfo,
    this.paymentDate,
    this.id,
  });

  factory BillModel.toModel(BillDbModel dbModel) {
    return BillModel(
      name: dbModel.name,
      amount: dbModel.amount,
      dueDate: dbModel.dueDate,
      paid: dbModel.paid,
      extraInfo: dbModel.extraInfo,
      paymentDate: dbModel.paymentDate,
      id: dbModel.id,
    );
  }

  final int? id;
  final String name;
  final double amount;
  final DateTime dueDate;
  final String? extraInfo;
  final bool paid;
  final DateTime? paymentDate;

  BillEntity toEntity() {
    return BillEntity(
      name: name,
      amount: amount,
      dueDate: dueDate,
      paid: paid,
      id: id,
      paymentDate: paymentDate,
      extraInfo: extraInfo,
    );
  }
}
