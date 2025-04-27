import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/translation/login_strings.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_cubit.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_state.dart';
import 'package:monthly_login/modules/login/presentation/pages/login_page.dart';

import '../../../../mocks/strings/mock_login_strings.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late LoginCubit mockLoginCubit;
  final mockGoRouter = MockGoRouter();
  final loginStrings = MockLoginStrings();
  setUpAll(() {
    mockLoginCubit = MockLoginCubit();

    GetIt.I.registerSingleton<LoginCubit>(mockLoginCubit);
    GetIt.I.registerSingleton<LoginStrings>(loginStrings);

    when(() => mockLoginCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockLoginCubit.state).thenReturn(LoginInitialState());
    when(() => mockLoginCubit.login()).thenAnswer((_) => Future.value());
  });

  tearDown(() {
    mockLoginCubit.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MockGoRouterProvider(
        goRouter: mockGoRouter,
        child: const LoginPage(),
      ),
    );
  }

  testWidgets('renders LoginPage with initial UI elements', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(Icon), findsOneWidget);
    expect(find.text('Controle de Despesas'), findsOneWidget);
    expect(
      find.text('Gerencie seus gastos de forma inteligente.'),
      findsOneWidget,
    );
    expect(find.text('Entrar com Google'), findsOneWidget);
  });

  testWidgets(
    'shows CircularProgressIndicator when state is LoginLoadingState',
    (tester) async {
      when(() => mockLoginCubit.state).thenReturn(LoginLoadingState());

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNothing);
    },
  );

  testWidgets('calls login method when login button is pressed', (
    tester,
  ) async {
    when(() => mockLoginCubit.state).thenReturn(LoginInitialState());

    await tester.pumpWidget(createWidgetUnderTest());

    final loginButton = find.text('Entrar com Google');
    expect(loginButton, findsOneWidget);

    await tester.tap(loginButton);
    verify(() => mockLoginCubit.login()).called(1);
  });

  testWidgets('shows error snackbar when state is LoginErrorState', (
    tester,
  ) async {
    whenListen(mockLoginCubit, Stream.fromIterable([LoginErrorState()]));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(
      find.text('Não foi possível realizar o login. Tente novamente.'),
      findsOneWidget,
    );
  });

  testWidgets('navigates to home when state is LoginSuccessState', (
    tester,
  ) async {
    whenListen(mockLoginCubit, Stream.fromIterable([LoginSuccessState()]));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('Login realizado com sucesso'), findsOneWidget);
    verify(() => mockGoRouter.go('/home')).called(1);
  });

  testWidgets('displays Google icon in login button', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final googleIcon = find.byType(SvgPicture);
    expect(googleIcon, findsOneWidget);
  });

  testWidgets('shows error snackbar when login fails', (tester) async {
    whenListen(mockLoginCubit, Stream.fromIterable([LoginErrorState()]));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(
      find.text('Não foi possível realizar o login. Tente novamente.'),
      findsOneWidget,
    );
  });

  testWidgets(
    'displays CircularProgressIndicator when state is LoginLoadingState',
    (tester) async {
      when(() => mockLoginCubit.state).thenReturn(LoginLoadingState());

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNothing);
    },
  );
}
