import 'package:flutter/material.dart';
import 'package:monthly_ui_components/components/dropdowm/bill_type_enum.dart';
import 'package:monthly_ui_components/core/translation/ui_strings.dart';

class BillTypeDropdown extends StatefulWidget {
  const BillTypeDropdown({
    required this.onChanged,
    this.isRequired = true,
    super.key,
    this.initialValue,
  });
  final BillTypesEnum? initialValue;
  final ValueChanged<BillTypesEnum?> onChanged;
  final bool isRequired;

  @override
  State<BillTypeDropdown> createState() => _BillTypeDropdownState();
}

class _BillTypeDropdownState extends State<BillTypeDropdown> {
  BillTypesEnum? _selectedBillType;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedBillType = widget.initialValue;
    return DropdownButtonFormField<BillTypesEnum>(
      key: const Key('billType'),
      value: _selectedBillType,
      decoration: InputDecoration(
        labelText: UIStrings.I.billType,
        border: const OutlineInputBorder(),
      ),
      items: _buildBillTypeDropdownItems(),
      onChanged: (value) {
        setState(() {
          _selectedBillType = value;
        });
        widget.onChanged(value);
      },
      validator:
          (value) =>
              widget.isRequired && value == null
                  ? UIStrings.I.selectBillType
                  : null,
    );
  }

  List<DropdownMenuItem<BillTypesEnum>> _buildBillTypeDropdownItems() {
    final billList =
        BillTypesEnum.values.toList()..sort(
          (BillTypesEnum a, BillTypesEnum b) =>
              a.description.compareTo(b.description),
        );
    return billList.map((billType) {
      return DropdownMenuItem<BillTypesEnum>(
        value: billType,
        child: Row(
          children: [
            Icon(billType.icon, size: 20),
            const SizedBox(width: 12),
            Text(billType.description),
          ],
        ),
      );
    }).toList();
  }
}
