import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late ReportStrings strings;

  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<ReportStrings>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(strings.reportTitle)),
        body: BasePage(
          child: Column(
            children: [
              SizedBox(height: hNormalSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BaseCard(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(vSmallSpace),
                        child: const Text(
                          'strings.configDateDescription',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.cardTitleColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: hNormalSpace),
                  Expanded(
                    child: BaseCard(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(vSmallSpace),
                        child: const Text(
                          'strings.configDateDescription',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.cardTitleColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: vSmallSpace),
            ],
          ),
        ),
      ),
    );
  }
}
