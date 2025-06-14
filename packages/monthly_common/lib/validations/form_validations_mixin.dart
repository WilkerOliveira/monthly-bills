import 'package:monthly_dependencies/monthly_dependencies.dart';

mixin FormValidationsMixin {
  String? validateRequiredField({required String message, String? value}) {
    if (value?.isEmpty ?? false) {
      return message;
    }

    return null;
  }

  String? validateDateField({
    required String locale,
    required String requiredFieldMessage,
    required String invalidDateMessage,
    required bool required,
    String? value,
  }) {
    if (!required && (value == null || value.isEmpty)) {
      return null;
    }

    var dateFormatte = 'MM/dd/yyyy';
    if (locale == 'pt_BR') {
      dateFormatte = 'dd/MM/yyyy';
    }

    if (value == null || value.isEmpty) {
      return requiredFieldMessage;
    }

    try {
      DateFormat(dateFormatte, locale).parseStrict(value);
      return null;
    } on Exception {
      return invalidDateMessage;
    }
  }
}
