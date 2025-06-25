import 'package:flutter/services.dart';
import 'package:monthly_common/helpers/constants/app_constants.dart';

class DateInputFormatter extends TextInputFormatter {
  DateInputFormatter({this.locale, this.customPattern})
    : assert(
        locale != null || customPattern != null,
        'Either locale or customPattern must be provided.',
      );
  final String? locale;
  final String? customPattern;

  String _getEffectivePattern() {
    if (customPattern != null) {
      return customPattern!;
    }
    switch (locale) {
      case 'pt_BR':
        return brDateFormat;
      case 'en_US':
        return usDateFormat;
      default:
        return brDateFormat;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final effectivePattern = _getEffectivePattern();

    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    final buffer = StringBuffer();
    final selectionIndex = newValue.selection.end;

    var separatorIndices = <int>[];
    var separatorChar = '/';

    if (effectivePattern == brDateFormat || effectivePattern == usDateFormat) {
      separatorIndices = [2, 4];
      separatorChar = '/';
    } else if (effectivePattern == 'yyyy-MM-dd') {
      separatorIndices = [4, 6];
      separatorChar = '-';
    }

    for (var i = 0; i < cleanedText.length; i++) {
      buffer.write(cleanedText[i]);
      if (separatorIndices.contains(i + 1) && i + 1 < 8) {
        buffer.write(separatorChar);
      }
    }

    var formattedText = buffer.toString();

    final maxLength = effectivePattern.length;
    if (formattedText.length > maxLength) {
      formattedText = formattedText.substring(0, maxLength);
    }

    var newSelectionIndex = selectionIndex;
    if (formattedText.length > oldValue.text.length) {
      if (selectionIndex > 0 &&
          separatorIndices.contains(selectionIndex - 1) &&
          newValue.text.length >
              separatorIndices[separatorIndices.indexOf(selectionIndex - 1)]) {
        newSelectionIndex++;
      }
    } else if (formattedText.length < oldValue.text.length) {
      if (selectionIndex > 0 &&
          separatorIndices.contains(selectionIndex) &&
          oldValue.text.length >
              separatorIndices[separatorIndices.indexOf(selectionIndex)]) {
        newSelectionIndex--;
      }
    }

    newSelectionIndex = newSelectionIndex.clamp(0, formattedText.length);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}
