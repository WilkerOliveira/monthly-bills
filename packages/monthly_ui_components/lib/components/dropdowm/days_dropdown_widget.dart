import 'package:flutter/material.dart';
import 'package:monthly_ui_components/core/translation/ui_strings.dart';

class DaysDropdownWidget extends StatefulWidget {
  const DaysDropdownWidget({
    required this.onSelected,
    super.key,
    this.label,
    this.inititalValue,
  });

  final void Function(int?) onSelected;
  final String? label;
  final int? inititalValue;

  @override
  State<DaysDropdownWidget> createState() => _DaysDropdownWidgetState();
}

class _DaysDropdownWidgetState extends State<DaysDropdownWidget> {
  int? _selectedNumber;

  @override
  void initState() {
    super.initState();
    _selectedNumber = widget.inititalValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      key: const Key('dayOfMonth'),
      value: _selectedNumber,
      decoration: InputDecoration(
        labelText: widget.label ?? UIStrings.I.dayOfMonth,
        border: const OutlineInputBorder(),
      ),
      isExpanded: true,
      onChanged: (int? newValue) {
        widget.onSelected(newValue);
        setState(() {
          _selectedNumber = newValue;
        });
      },
      items:
          List.generate(31, (index) {
            final number = index + 1;
            return DropdownMenuItem<int>(
              value: number,
              child: Center(child: Text('$number')),
            );
          }).toList(),
    );
  }
}
