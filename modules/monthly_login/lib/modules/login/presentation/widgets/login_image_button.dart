import 'package:flutter/material.dart';
import 'package:monthly_login/core/translation/login_translate_loader.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class LoginImageButton extends StatelessWidget {
  const LoginImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SvgImageAsset(
      assetPath: 'assets/icons/google.svg',
      package: LoginTranslateLoader.package,
      height: 24,
    );
  }
}
