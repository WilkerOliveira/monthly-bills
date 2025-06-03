import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/entities/bill_entity.dart';
import 'package:monthly_register/modules/bills/data/repository/bills_repository_impl.dart';
import 'package:monthly_register/modules/core/models/bill_model.dart';

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
        category: 'childcare',
      ),
    );
  });

  setUp(() {
    mockDatabase = MockRegisterDatabase();
    repository = BillsRepositoryImpl(database: mockDatabase);
    registerFallbackValue(FakeBillEntity());
    registerFallbackValue(FakeBillModel());
  });

  group('BillsRepositoryImpl', () {
    group('getByRangeDate', () {
      final begin = DateTime(2024, 6);
      final end = DateTime(2024, 6, 30);

      test(
        'returns list of BillEntity when database returns BillDbModel list',
        () async {
          final dbModels = [
            BillDbModel(
              name: 'Internet',
              amount: 50,
              dueDate: DateTime(2024, 6, 10),
              extraInfo: 'Monthly',
              paid: true,
              category: 'internet',
            ),
            BillDbModel(
              name: 'Electricity',
              amount: 120,
              dueDate: DateTime(2024, 6, 15),
              extraInfo: '',
              paid: false,
              category: 'electricity',
            ),
          ];

          when(
            () => mockDatabase.getByRangeDate(begin, end),
          ).thenAnswer((_) async => dbModels);

          final result = await repository.getByRangeDate(begin, end);

          expect(result, isA<List<BillEntity>>());
          expect(result.length, dbModels.length);
          expect(result[0].name, dbModels[0].name);
          expect(result[1].amount, dbModels[1].amount);
        },
      );

      test('returns empty list when database returns empty list', () async {
        when(
          () => mockDatabase.getByRangeDate(begin, end),
        ).thenAnswer((_) async => []);

        final result = await repository.getByRangeDate(begin, end);

        expect(result, isA<List<BillEntity>>());
        expect(result, isEmpty);
      });

      test('throws if database throws', () async {
        when(
          () => mockDatabase.getByRangeDate(begin, end),
        ).thenThrow(Exception('Database error'));

        expect(
          () => repository.getByRangeDate(begin, end),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
