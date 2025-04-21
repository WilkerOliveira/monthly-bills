import 'package:flutter/material.dart';
import 'package:monthly_bills/firebase_options.dart';
import 'package:monthly_core/monthly_core.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MainDI.setup();
  runApp(const MonthlBillsApp());
}

class MonthlBillsApp extends StatelessWidget {
  const MonthlBillsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppThemes.darkTheme,
      routerConfig: MainRouters.routes,
    );
  }
}
