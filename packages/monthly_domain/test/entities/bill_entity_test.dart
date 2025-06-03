import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_domain/entities/bill_entity.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

void main() {
  group('BillEntity', () {
    test('supports value equality', () {
      final bill1 = BillEntity(
        id: 1,
        name: 'Electricity',
        amount: 100,
        dueDate: DateTime(2024, 7),
        extraInfo: 'Monthly bill',
        paid: false,
        category: BillTypesEnum.electricity.key,
      );
      final bill2 = BillEntity(
        id: 1,
        name: 'Electricity',
        amount: 100,
        dueDate: DateTime(2024, 7),
        extraInfo: 'Monthly bill',
        paid: false,
        category: BillTypesEnum.electricity.key,
      );
      expect(bill1, equals(bill2));
    });

    test('props contains all fields', () {
      final bill = BillEntity(
        id: 2,
        name: 'Water',
        amount: 50.5,
        dueDate: DateTime(2024, 7, 10),
        extraInfo: 'Quarterly',
        paid: true,
        paymentDate: DateTime(2024, 7, 5),
        category: BillTypesEnum.childcare.key,
      );
      expect(bill.props, [
        2,
        'Water',
        50.5,
        DateTime(2024, 7, 10),
        'Quarterly',
        true,
        DateTime(2024, 7, 5),
        'childcare',
      ]);
    });

    test('can be instantiated with minimal required fields', () {
      final bill = BillEntity(
        name: 'Internet',
        amount: 75,
        dueDate: DateTime(2024, 7, 15),
        category: BillTypesEnum.childcare.key,
        paid: false,
      );
      expect(bill.name, 'Internet');
      expect(bill.amount, 75.0);
      expect(bill.category, 'childcare');
      expect(bill.dueDate, DateTime(2024, 7, 15));
      expect(bill.paid, false);
      expect(bill.extraInfo, isNull);
      expect(bill.paymentDate, isNull);
      expect(bill.id, isNull);
    });
  });
}
