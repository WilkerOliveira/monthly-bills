import 'package:flutter/material.dart';
import 'package:monthly_ui_components/dimen/app_sizes.dart';

class BasePage extends StatefulWidget {
  const BasePage({required this.child, super.key});

  final Widget child;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenHeight,
      height: screenHeight,
      margin: EdgeInsets.symmetric(
        horizontal: hTinySpace,
        vertical: vTinySpace,
      ),
      child: widget.child,
    );
  }
}
