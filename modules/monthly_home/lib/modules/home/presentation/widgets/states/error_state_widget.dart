import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ErrorStateWidget extends StatefulWidget {
  const ErrorStateWidget({super.key});

  @override
  State<ErrorStateWidget> createState() => _ErrorStateWidgetState();
}

class _ErrorStateWidgetState extends State<ErrorStateWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    return Column(
      children: [
        SizedBox(height: vBigSpace),
        SizedBox(
          height: largeImage,
          child: Lottie.asset(
            'assets/animations/error_lottie.json',
            package: 'monthly_home',
            fit: BoxFit.contain,
            controller: _controller,
            animate: false,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
            },
          ),
        ),
        SizedBox(height: vNormalSpace),
        Text(
          strings.homeErrorMessage,
          style: TextStyle(
            fontSize: subTitleTextSize,
            color: Colors.red.shade300,
          ),
        ),
      ],
    );
  }
}
