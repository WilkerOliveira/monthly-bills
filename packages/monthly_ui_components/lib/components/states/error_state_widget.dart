import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_ui_components/core/translation/ui_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ErrorStateWidget extends StatefulWidget {
  const ErrorStateWidget({super.key, this.message});

  final String? message;

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
    return Column(
      children: [
        SizedBox(height: vBigSpace),
        SizedBox(
          height: largeImage,
          child: Lottie.asset(
            'assets/animations/error_lottie.json',
            package: 'monthly_ui_components',
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
          widget.message ?? UIStrings.I.errorMessage,
          style: TextStyle(
            fontSize: subTitleTextSize,
            color: Colors.red.shade300,
          ),
        ),
      ],
    );
  }
}
