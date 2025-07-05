import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({super.key, this.title, this.message});
  final String? title;
  final String? message;

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget>
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: mediumImage,
          child: Lottie.asset(
            'assets/animations/empty.json',
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
          widget.title ?? '',
          style: TextStyle(fontSize: subTitleTextSize, color: Colors.grey),
        ),
        SizedBox(height: vTinySpace),
        Text(
          widget.message ?? '',
          style: TextStyle(
            fontSize: defaultFontSize,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
