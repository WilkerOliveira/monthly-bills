import 'package:flutter/material.dart';
import 'package:monthly_core/page_view/presentation/pages/cubit/navigation_cubit.dart';
import 'package:monthly_core/page_view/presentation/pages/cubit/navigation_state.dart';
import 'package:monthly_core/page_view/presentation/widgets/bottom_nav_bar.dart';
import 'package:monthly_core/page_view/presentation/widgets/fab/new_bill_fab.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class MainPage extends StatelessWidget {
  const MainPage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: child,

            floatingActionButton: const NewBillFab(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavBar(currentIndex: state.currentIndex),
          );
        },
      ),
    );
  }
}
