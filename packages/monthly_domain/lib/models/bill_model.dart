import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';

class BillModel {
  BillModel({
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.paid,
    required this.category,
    this.recurrences,
    this.extraInfo,
    this.paymentDate,
    this.id,
    this.recurrenceId,
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
      category: dbModel.category,
      recurrences: dbModel.recurrences,
      recurrenceId: dbModel.recurrenceId,
    );
  }

  factory BillModel.entityToModel(BillEntity entity) {
    return BillModel(
      name: entity.name,
      amount: entity.amount,
      dueDate: entity.dueDate,
      paid: entity.paid,
      extraInfo: entity.extraInfo,
      paymentDate: entity.paymentDate,
      id: entity.id,
      category: entity.category,
      recurrences: entity.recurrences,
      recurrenceId: entity.recurrenceId,
    );
  }

  final int? id;
  final String category;
  final String name;
  final double amount;
  final DateTime dueDate;
  final String? extraInfo;
  final bool paid;
  final DateTime? paymentDate;
  final int? recurrences;
  final int? recurrenceId;

  BillEntity toEntity() {
    return BillEntity(
      name: name,
      amount: amount,
      dueDate: dueDate,
      paid: paid,
      id: id,
      paymentDate: paymentDate,
      extraInfo: extraInfo,
      category: category,
      recurrences: recurrences,
      recurrenceId: recurrenceId,
    );
  }

  BillDbModel toDbModel() {
    return BillDbModel(
      id: id,
      name: name,
      amount: amount,
      dueDate: dueDate,
      paid: paid,
      paymentDate: paymentDate,
      extraInfo: extraInfo,
      category: category,
      recurrences: recurrences,
      recurrenceId: recurrenceId,
    );
  }
}
