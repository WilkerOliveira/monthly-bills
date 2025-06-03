import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/core/models/bill_model.dart';

class MockBillDbModel extends Mock implements BillDbModel {}

class MockBillEntity extends Mock implements BillEntity {}

void main() {
  group('BillModel', () {
    final testDate = DateTime(2024, 6);

    test('should create BillModel from BillDbModel', () {
      final dbModel = BillDbModel(
        name: 'Internet',
        amount: 50,
        dueDate: testDate,
        paid: false,
        extraInfo: 'Monthly bill',
        category: 'internet',
      );
      final model = BillModel.toModel(dbModel);

      expect(model.name, 'Internet');
      expect(model.amount, 50.0);
      expect(model.dueDate, testDate);
      expect(model.paid, false);
      expect(model.category, 'internet');
      expect(model.extraInfo, 'Monthly bill');
      expect(model.paymentDate, null);
    });

    test('should create BillModel from BillEntity', () {
      final entity = BillEntity(
        name: 'Water',
        amount: 30,
        dueDate: testDate,
        paid: true,
        id: 1,
        paymentDate: testDate,
        extraInfo: 'Paid early',
        category: 'water',
      );
      final model = BillModel.entityToModel(entity);

      expect(model.name, 'Water');
      expect(model.amount, 30.0);
      expect(model.dueDate, testDate);
      expect(model.paid, true);
      expect(model.category, 'category');
      expect(model.id, 1);
      expect(model.paymentDate, testDate);
      expect(model.extraInfo, 'Paid early');
    });

    test('should convert BillModel to BillEntity', () {
      final model = BillModel(
        name: 'Electricity',
        amount: 100,
        dueDate: testDate,
        paid: false,
        id: 2,
        category: 'electricity',
      );
      final entity = model.toEntity();

      expect(entity.name, 'Electricity');
      expect(entity.amount, 100.0);
      expect(entity.dueDate, testDate);
      expect(entity.paid, false);
      expect(entity.id, 2);
      expect(entity.category, 'electricity');
      expect(entity.paymentDate, null);
      expect(entity.extraInfo, null);
    });

    test('should convert BillModel to BillDbModel', () {
      final model = BillModel(
        name: 'Rent',
        amount: 1200,
        dueDate: testDate,
        paid: true,
        paymentDate: testDate,
        extraInfo: 'Paid on time',
        category: 'rent',
      );
      final dbModel = model.toDbModel();

      expect(dbModel.name, 'Rent');
      expect(dbModel.amount, 1200.0);
      expect(dbModel.dueDate, testDate);
      expect(dbModel.category, 'rent');
      expect(dbModel.paid, true);
      expect(dbModel.paymentDate, testDate);
      expect(dbModel.extraInfo, 'Paid on time');
    });
  });
}
