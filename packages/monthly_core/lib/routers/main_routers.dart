import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/monthly_home.dart';
import 'package:monthly_login/monthly_login.dart';
import 'package:monthly_register/monthly_register.dart';
import 'package:monthly_report/monthly_report.dart';

abstract class MainRouters {
  static final GoRouter routes = GoRouter(
    initialLocation: LoginRoutersPath.login,
    routes: <RouteBase>[
      ...loginRoutes,
      ...homeRoutes,
      ...registerRoutes,
      ...reportRoutes,
    ],
    redirect: (context, state) {
      final isLoggedIn = MonthlyDI.I.get<AuthService>().isLoggedIn();
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
}
