import 'package:flutter/material.dart';

Future<DateTime?> showDatePickerDialog({
  required BuildContext context,
  DateTime? initialDate,
}) async {
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(data: ThemeData.dark(), child: child!);
    },
  );
}
