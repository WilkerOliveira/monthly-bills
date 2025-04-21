import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/exceptions/login_failure.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';
import 'package:monthly_login/modules/login/domain/repositories/login_repository.dart';
import 'package:monthly_login/modules/login/domain/usecases/login_usecase.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late LoginUsecaseImpl loginUsecase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginUsecase = LoginUsecaseImpl(mockLoginRepository);
  });

  group('LoginUsecaseImpl', () {
    test('should return UserEntity when login is successful', () async {
      const user = UserEntity(
        id: '123',
        name: 'Test User',
        email: 'email@email.com',
      );
      when(
        () => mockLoginRepository.login(),
      ).thenAnswer((_) async => const Success(user));

      final result = await loginUsecase.call();

      expect(result.isSuccess(), true);
      expect(result.getOrNull(), user);
      verify(() => mockLoginRepository.login()).called(1);
    });

    test('should return LoginFailure when login fails', () async {
      final failure = InvalidCredentialFailure();
      when(
        () => mockLoginRepository.login(),
      ).thenAnswer((_) async => Failure(failure));

      final result = await loginUsecase.call();

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), failure);
      verify(() => mockLoginRepository.login()).called(1);
    });
  });
}
