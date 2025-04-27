import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class SvgImageAsset extends StatelessWidget {
  const SvgImageAsset({
    required this.package,
    required this.assetPath,
    required this.height,
    super.key,
  });
  final String package;
  final String assetPath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetPath, package: package, height: height);
  }
}
