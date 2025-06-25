import 'package:flutter/foundation.dart';

@immutable
abstract class DescriptionAutocompleteState {
  const DescriptionAutocompleteState({
    this.query = '',
    this.suggestions = const [],
  });
  final String query;
  final List<String> suggestions;
}

class AutocompleteInitial extends DescriptionAutocompleteState {
  const AutocompleteInitial({super.query, super.suggestions});
}

class AutocompleteLoading extends DescriptionAutocompleteState {
  const AutocompleteLoading({required super.query, super.suggestions});
}

class AutocompleteLoaded extends DescriptionAutocompleteState {
  const AutocompleteLoaded({required super.query, required super.suggestions});
}

class AutocompleteError extends DescriptionAutocompleteState {
  const AutocompleteError({
    required super.query,
    required this.message,
    super.suggestions,
  });
  final String message;
}
