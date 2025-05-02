extension StringExtension on String {
  String replace(List<String> replacements, List<String> values) {
    if (replacements.length != values.length) {
      throw ArgumentError('Replacements and values must have the same length');
    }

    var result = this;

    for (var i = 0; i < replacements.length; i++) {
      result = result.replaceAll(replacements[i], values[i]);
    }

    return result;
  }
}
