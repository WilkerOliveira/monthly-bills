import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_ui_components/core/translation/ui_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class DateRangeFilterWidget extends StatefulWidget {
  const DateRangeFilterWidget({required this.onFilter, super.key});

  final void Function(DateTime startDate, DateTime endDate) onFilter;

  @override
  State<DateRangeFilterWidget> createState() => _DateRangeFilterWidgetState();
}

class _DateRangeFilterWidgetState extends State<DateRangeFilterWidget> {
  DateTime? _startDate;
  DateTime? _endDate;
  final _startController = TextEditingController();
  final _endController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final initialDate =
        isStart ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          _startController.text = picked.toLocaleDateFormat(UIStrings.I.locale);
        } else {
          _endDate = picked;
          _endController.text = picked.toLocaleDateFormat(UIStrings.I.locale);
        }
      });
    }
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.38,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hNormalSpace,
            vertical: vNormalSpace,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _startController,
                          readOnly: true,
                          onTap: () => _selectDate(context, true),
                          decoration: InputDecoration(
                            labelText: UIStrings.I.startDate,
                            prefixIcon: const Icon(
                              Icons.date_range,
                              color: Colors.tealAccent,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return UIStrings.I.requiredField;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: vNormalSpace),
                        TextFormField(
                          controller: _endController,
                          readOnly: true,
                          onTap: () => _selectDate(context, false),
                          decoration: InputDecoration(
                            labelText: UIStrings.I.endDate,
                            prefixIcon: const Icon(
                              Icons.date_range,
                              color: Colors.tealAccent,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return UIStrings.I.requiredField;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: vNormalSpace),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();

                    if (_startDate != null && _endDate != null) {
                      if (_endDate!.isBefore(_startDate!)) {
                        MonthlySnackBar.alert(
                          context,
                          message: UIStrings.I.endDateBeforeStartDate,
                        );
                      } else {
                        widget.onFilter(_startDate!, _endDate!);
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                ),
                child: Text(UIStrings.I.filter),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
