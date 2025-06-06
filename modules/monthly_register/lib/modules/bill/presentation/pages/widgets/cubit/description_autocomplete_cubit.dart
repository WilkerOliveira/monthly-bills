import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/modules/bill/domain/usecases/get_unique_descriptions_usecase.dart';
import 'package:monthly_register/modules/bill/presentation/pages/widgets/cubit/description_autocomplete_state.dart';

class DescriptionAutocompleteCubit extends Cubit<DescriptionAutocompleteState> {
  DescriptionAutocompleteCubit(this._getAllDescriptionUsecase)
    : super(const AutocompleteInitial());

  final GetUniqueDescriptionsUsecase _getAllDescriptionUsecase;
  List<String> _allDescriptions = [];

  void init() {
    getAllDescriptions();
  }

  Future<void> getAllDescriptions() async {
    try {
      final result = await _getAllDescriptionUsecase();

      result.fold(
        (descriptions) => _allDescriptions = descriptions,
        (failure) => _allDescriptions = [],
      );
    } on Exception catch (_) {
      _allDescriptions = [];
    }
  }

  Future<List<String>> getSuggestions(String query) async {
    emit(AutocompleteLoading(query: query, suggestions: state.suggestions));

    if (query.isEmpty) {
      emit(AutocompleteLoaded(query: query, suggestions: const []));
      return const [];
    }

    try {
      final filteredSuggestions =
          _allDescriptions
              .where(
                (description) =>
                    description.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();

      emit(AutocompleteLoaded(query: query, suggestions: filteredSuggestions));
      return filteredSuggestions;
    } on Exception {
      emit(
        AutocompleteError(
          query: query,
          message: 'Error',
          suggestions: state.suggestions,
        ),
      );
      return [];
    }
  }

  void onOptionSelected(String selectedOption) {
    emit(AutocompleteLoaded(query: selectedOption, suggestions: const []));
  }

  void clearSelection() {
    emit(const AutocompleteLoaded(query: '', suggestions: []));
  }
}
