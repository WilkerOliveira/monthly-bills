import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/translation/login_strings.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_cubit.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_state.dart';
import 'package:monthly_login/modules/login/presentation/pages/login_page.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

class MockLoginStrings extends Mock implements LoginStrings {}

void main() {
  late MockLoginCubit mockCubit;
  late MockLoginStrings mockStrings;

  setUp(() {
    MonthlyDI.enableTestMode();
    TestWidgetsFlutterBinding.ensureInitialized();
    mockCubit = MockLoginCubit();
    mockStrings = MockLoginStrings();

    MonthlyDI.I.registerFactory<LoginCubit>(() => mockCubit);
    MonthlyDI.I.registerLazySingleton<LoginStrings>(() => mockStrings);

    when(
      () => mockStrings.somethingWentWrong,
    ).thenReturn('Something went wrong');
    when(() => mockStrings.loginSuccessMessage).thenReturn('Login successful');
    when(() => mockStrings.loginAppName).thenReturn('App Name');
    when(() => mockStrings.loginAppNameDesc).thenReturn('App Description');
    when(() => mockStrings.loginButtonTitle).thenReturn('Login');

    when(() => mockCubit.close()).thenAnswer((_) => Future.value());
  });

  tearDown(() {
    MonthlyDI.I.reset();
  });

  testWidgets('renders LoginPage and shows login button', (tester) async {
    when(() => mockCubit.state).thenReturn(LoginInitialState());
    whenListen(
      mockCubit,
      Stream<LoginState>.fromIterable([LoginInitialState()]),
      initialState: LoginInitialState(),
    );

    await pumpWidgetTest(tester);

    expect(find.text('App Name'), findsOneWidget);
    expect(find.text('App Description'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(CustomIconButton), findsOneWidget);
  });

  testWidgets('shows CircularProgressIndicator when loading', (tester) async {
    when(() => mockCubit.state).thenReturn(LoginLoadingState());
    whenListen(
      mockCubit,
      Stream<LoginState>.fromIterable([LoginLoadingState()]),
      initialState: LoginLoadingState(),
    );

    await pumpWidgetTest(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(CustomIconButton), findsNothing);
  });

  testWidgets('calls cubit.login when login button is pressed', (tester) async {
    when(() => mockCubit.state).thenReturn(LoginInitialState());
    when(() => mockCubit.login()).thenAnswer((_) => Future.value());
    whenListen(
      mockCubit,
      Stream<LoginState>.fromIterable([LoginInitialState()]),
      initialState: LoginInitialState(),
    );

    await pumpWidgetTest(tester);

    await tester.tap(find.byType(CustomIconButton));
    verify(() => mockCubit.login()).called(1);
  });

  testWidgets('shows error snackbar on LoginErrorState', (tester) async {
    when(() => mockCubit.state).thenReturn(LoginInitialState());
    whenListen(
      mockCubit,
      Stream<LoginState>.fromIterable([LoginInitialState(), LoginErrorState()]),
      initialState: LoginInitialState(),
    );

    await pumpWidgetTest(tester);

    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Something went wrong'), findsOneWidget);
  });
}

Future<void> pumpWidgetTest(WidgetTester tester) async {
  await tester.pumpWidget(
    const ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(home: LoginPage()),
    ),
  );
}
