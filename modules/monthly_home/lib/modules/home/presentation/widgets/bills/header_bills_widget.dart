import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class HeaderBillsWidget extends StatelessWidget {
  const HeaderBillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hMediumSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            strings.homeSubtitle,
            style: TextStyle(
              fontSize: subTitleTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              strings.homeSeeAll,
              style: const TextStyle(
                color: AppColors.surface,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
