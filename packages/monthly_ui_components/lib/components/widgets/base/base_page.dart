import 'package:flutter/material.dart';
import 'package:monthly_ui_components/sizes/app_size.dart';

class BasePage extends StatefulWidget {
  const BasePage({required this.child, super.key});

  final Widget child;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenHeight,
      height: screenHeight,
      child: widget.child,
    );
  }
}
