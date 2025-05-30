import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.account_balance_wallet_rounded,
      size: 80,
      color: Colors.greenAccent,
    );
  }
}
