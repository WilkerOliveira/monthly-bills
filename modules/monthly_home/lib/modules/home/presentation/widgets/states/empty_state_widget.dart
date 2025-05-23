import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({super.key});

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
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    return Column(
      children: [
        SizedBox(height: vBigSpace),
        SizedBox(
          height: largeImage,
          child: Lottie.asset(
            'assets/animations/empty.json',
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
          strings.homeNoBillsMessage,
          style: TextStyle(fontSize: subTitleTextSize, color: Colors.grey),
        ),
        SizedBox(height: vTinySpace),
        Text(
          strings.homeAddFirstBill,
          style: TextStyle(
            fontSize: defaultFontSize,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
