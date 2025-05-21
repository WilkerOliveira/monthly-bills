import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/entities/bill_entity.dart';
import 'package:monthly_register/modules/bills/core/exceptions/bills_exceptions.dart';
import 'package:monthly_register/modules/bills/data/models/bill_model.dart';
import 'package:monthly_register/modules/bills/data/repository/bills_repository_impl.dart';

class MockRegisterDatabase extends Mock implements RegisterDatabase {}

class FakeBillEntity extends Fake implements BillEntity {}

class FakeBillModel extends Fake implements BillModel {}

void main() {
  late BillsRepositoryImpl repository;
  late MockRegisterDatabase mockDatabase;

  setUpAll(() {
    registerFallbackValue(
      BillDbModel(
        name: 'Test Bill',
        amount: 100,
        dueDate: DateTime(2024, 6),
        extraInfo: '',
        paid: false,
      ),
    );
  });

  setUp(() {
    mockDatabase = MockRegisterDatabase();
    repository = BillsRepositoryImpl(database: mockDatabase);
    registerFallbackValue(FakeBillEntity());
    registerFallbackValue(FakeBillModel());
  });

  group('getById', () {
    test('returns BillEntity when register is found', () async {
      final dbModel = BillDbModel(
        name: 'Test Bill',
        amount: 100,
        dueDate: DateTime(2024, 6),
        extraInfo: '',
        paid: false,
      );
      when(() => mockDatabase.getById(1)).thenAnswer((_) async => dbModel);

      final result = await repository.getById(1);

      expect(result, isA<BillEntity>());
      expect(result.name, 'Test Bill');
      expect(result.amount, 100.0);
      expect(result.dueDate, DateTime(2024, 6));
      expect(result.paid, false);
    });

    test('throws BillNotFoundException when register is not found', () async {
      when(() => mockDatabase.getById(2)).thenAnswer((_) async => null);

      expect(
        () => repository.getById(2),
        throwsA(isA<BillNotFoundException>()),
      );
      verify(() => mockDatabase.getById(2)).called(1);
    });
  });

  group('save', () {
    test('calls saveBill with correct BillDbModel', () async {
      final billEntity = BillEntity(
        name: 'Test Bill',
        amount: 100,
        dueDate: DateTime(2024, 6),
        paid: false,
      );
      when(
        () => mockDatabase.saveBill(any()),
      ).thenAnswer((_) async => Future.value(1));

      await repository.save(billEntity);

      verify(
        () => mockDatabase.saveBill(
          any(
            that: isA<BillDbModel>()
                .having((b) => b.name, 'name', 'Test Bill')
                .having((b) => b.amount, 'amount', 100.0)
                .having((b) => b.dueDate, 'dueDate', DateTime(2024, 6))
                .having((b) => b.paid, 'paid', false),
          ),
        ),
      ).called(1);
    });
  });
}
