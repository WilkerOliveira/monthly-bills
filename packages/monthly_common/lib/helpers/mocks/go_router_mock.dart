import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    super.key,
  });

  final MockGoRouter goRouter;

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      InheritedGoRouter(goRouter: goRouter, child: child);
}
