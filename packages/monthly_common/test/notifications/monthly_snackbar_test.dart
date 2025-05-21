import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monthly_common/notifications/monthly_snackbar.dart';

class MockScaffoldMessengerState extends Mock
    implements ScaffoldMessengerState {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeBuildContext());
    registerFallbackValue(FakeSnackBar());
  });

  testWidgets(
    'MonthlySnackBar.show displays SnackBar with correct message and colors',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    MonthlySnackBar.show(
                      context,
                      message: 'Test Message',
                      backgroundColor: Colors.purple,
                      textColor: Colors.yellow,
                      duration: const Duration(seconds: 2),
                    );
                  },
                  child: const Text('Show'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pump(); // show snackbar

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Test Message'), findsOneWidget);

      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, Colors.purple);
      expect(snackBar.duration, const Duration(seconds: 2));
      final text = snackBar.content as Text;
      expect(text.style?.color, Colors.yellow);
    },
  );

  testWidgets('MonthlySnackBar.success uses green background', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  MonthlySnackBar.success(context, message: 'Success!');
                },
                child: const Text('Show'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, Colors.green);
    expect(find.text('Success!'), findsOneWidget);
  });

  testWidgets('MonthlySnackBar.info uses blue background', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  MonthlySnackBar.info(context, message: 'Info!');
                },
                child: const Text('Show'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, Colors.blue);
    expect(find.text('Info!'), findsOneWidget);
  });

  testWidgets('MonthlySnackBar.alert uses orange background', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  MonthlySnackBar.alert(context, message: 'Alert!');
                },
                child: const Text('Show'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, Colors.orange);
    expect(find.text('Alert!'), findsOneWidget);
  });

  testWidgets('MonthlySnackBar.error uses red background', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  MonthlySnackBar.error(context, message: 'Error!');
                },
                child: const Text('Show'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, Colors.red);
    expect(find.text('Error!'), findsOneWidget);
  });
}

class FakeBuildContext extends Fake implements BuildContext {}

class FakeSnackBar extends Fake implements SnackBar {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}
