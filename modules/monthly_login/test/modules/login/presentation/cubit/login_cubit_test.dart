import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/exceptions/login_failure.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';
import 'package:monthly_login/modules/login/domain/usecases/login_usecase.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_cubit.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_state.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  late LoginCubit loginCubit;
  late MockLoginUsecase mockLoginUsecase;

  const user = UserEntity(
    id: '123',
    name: 'Test User',
    email: 'email@email.com',
  );

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginCubit = LoginCubit(loginUsecase: mockLoginUsecase);
  });

  tearDown(() {
    loginCubit.close();
  });

  group('LoginCubit', () {
    test('initial state is LoginInitialState', () {
      expect(loginCubit.state, isInstanceOf<LoginInitialState>());
    });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginLoadingState, LoginSuccessState] when login is successful',
      build: () {
        when(
          () => mockLoginUsecase(),
        ).thenAnswer((_) async => const Success(user));
        return loginCubit;
      },
      act: (cubit) => cubit.login(),
      expect:
          () => [
            isInstanceOf<LoginLoadingState>(),
            isInstanceOf<LoginSuccessState>(),
          ],
      verify: (_) {
        verify(() => mockLoginUsecase()).called(1);
      },
    );

    blocTest<LoginCubit, LoginState>(
      '''
        emits [LoginLoadingState, LoginErrorState] when loginUsecase 
        throws an exception
      ''',
      build: () {
        when(
          () => mockLoginUsecase(),
        ).thenAnswer((_) async => Failure(UserNotFoundFailure()));
        return loginCubit;
      },
      act: (cubit) => cubit.login(),
      expect:
          () => [
            isInstanceOf<LoginLoadingState>(),
            isInstanceOf<LoginErrorState>(),
          ],
      verify: (_) {
        verify(() => mockLoginUsecase()).called(1);
      },
    );
  });
}
