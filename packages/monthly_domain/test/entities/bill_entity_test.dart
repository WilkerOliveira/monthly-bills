import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_domain/entities/bill_entity.dart';

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
      );
      final bill2 = BillEntity(
        id: 1,
        name: 'Electricity',
        amount: 100,
        dueDate: DateTime(2024, 7),
        extraInfo: 'Monthly bill',
        paid: false,
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
      );
      expect(bill.props, [
        2,
        'Water',
        50.5,
        DateTime(2024, 7, 10),
        'Quarterly',
        true,
        DateTime(2024, 7, 5),
      ]);
    });

    test('can be instantiated with minimal required fields', () {
      final bill = BillEntity(
        name: 'Internet',
        amount: 75,
        dueDate: DateTime(2024, 7, 15),
        paid: false,
      );
      expect(bill.name, 'Internet');
      expect(bill.amount, 75.0);
      expect(bill.dueDate, DateTime(2024, 7, 15));
      expect(bill.paid, false);
      expect(bill.extraInfo, isNull);
      expect(bill.paymentDate, isNull);
      expect(bill.id, isNull);
    });
  });
}
