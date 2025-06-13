import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_core/page_view/presentation/pages/main_page.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/monthly_home.dart';
import 'package:monthly_login/monthly_login.dart';
import 'package:monthly_profile/monthly_profile.dart';
import 'package:monthly_register/monthly_register.dart';
import 'package:monthly_report/monthly_report.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: LoginRoutersPath.login,
  routes: <RouteBase>[
    StatefulShellRoute(
      navigatorContainerBuilder: (
        BuildContext context,
        StatefulNavigationShell navigationShell,
        List<Widget> children,
      ) {
        return IndexedStack(
          index: navigationShell.currentIndex,
          children: children,
        );
      },
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return MainPage(child: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: MainRoutes.home),
          routes: <RouteBase>[
            GoRoute(
              path: MainRoutes.home,
              pageBuilder:
                  (context, state) => const NoTransitionPage(child: HomePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: MainRoutes.bills),
          routes: <RouteBase>[
            GoRoute(
              path: MainRoutes.bills,
              pageBuilder:
                  (context, state) =>
                      const NoTransitionPage(child: BillsPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(
            debugLabel: MainRoutes.monthlyReport,
          ),
          routes: <RouteBase>[
            GoRoute(
              path: MainRoutes.monthlyReport,
              pageBuilder:
                  (context, state) => const NoTransitionPage(child: HomePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(
            debugLabel: MainRoutes.profile,
          ),
          routes: <RouteBase>[
            GoRoute(
              path: MainRoutes.profile,
              pageBuilder:
                  (context, state) =>
                      const NoTransitionPage(child: ProfilePage()),
            ),
          ],
        ),
      ],
    ),
    ...loginRoutes,
    ...registerRoutes,
    ...reportRoutes,
  ],
  redirect: (context, state) {
    final isLoggedIn = MonthlyDI.I.get<AuthServiceContract>().isLoggedIn;
    final isAuthRoute = state.matchedLocation.startsWith('/auth');

    if (!isLoggedIn && !isAuthRoute) {
      return LoginRoutersPath.login;
    }

    if (isLoggedIn && isAuthRoute) {
      return MainRoutes.home;
    }

    return null;
  },
);
