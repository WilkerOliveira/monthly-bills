import 'package:flutter/material.dart';
import 'package:monthly_bills/firebase_options.dart';
import 'package:monthly_core/monthly_core.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MainDI.setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: multiAssetLoader,
      child: const MonthlBillsApp(),
    ),
  );
}

class MonthlBillsApp extends StatelessWidget {
  const MonthlBillsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        title: 'Flutter Demo',
        theme: AppThemes.darkTheme,
        routerConfig: MainRouters.routes,
      ),
    );
  }
}
