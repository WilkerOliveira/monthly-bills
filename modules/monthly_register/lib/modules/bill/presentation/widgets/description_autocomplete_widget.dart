import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/modules/bill/presentation/widgets/cubit/description_autocomplete_cubit.dart';
import 'package:monthly_register/modules/bill/presentation/widgets/cubit/description_autocomplete_state.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class DescriptionAutocompleteWidget extends StatelessWidget {
  const DescriptionAutocompleteWidget({
    required this.labelText,
    required this.onSelected,
    required this.validator,
    required this.onSaved,
    required this.initialValue,
    super.key,
  });

  final String labelText;
  final String initialValue;
  final void Function(String) onSelected;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DescriptionAutocompleteCubit>();

    return Autocomplete<String>(
      initialValue: TextEditingValue(text: initialValue),
      optionsBuilder: (TextEditingValue textEditingValue) async {
        return cubit.getSuggestions(textEditingValue.text);
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<String> onSelectedCallback,
        Iterable<String> options,
      ) {
        return BlocBuilder<
          DescriptionAutocompleteCubit,
          DescriptionAutocompleteState
        >(
          builder: (context, state) {
            return Align(
              alignment: Alignment.topLeft,
              child: Card(
                color: AppColors.background,
                elevation: 4,
                child: SizedBox(
                  height: autoCompleteHeight,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                        height: 5,
                        color: AppColors.primary,
                      );
                    },
                    padding: EdgeInsets.zero,
                    itemCount: state.suggestions.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = state.suggestions.elementAt(index);
                      return ListTile(
                        title: Text(
                          option,
                          style: TextStyle(
                            color: AppColors.cardTitleColor,
                            fontSize: defaultFontSize,
                          ),
                        ),
                        onTap: () {
                          onSelectedCallback(option);
                          cubit.onOptionSelected(option);
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
      onSelected: onSelected,
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmittedCallback,
      ) {
        return BlocListener<
          DescriptionAutocompleteCubit,
          DescriptionAutocompleteState
        >(
          listener: (context, state) {
            if (textEditingController.text != state.query) {
              textEditingController
                ..text = state.query
                ..selection = TextSelection.fromPosition(
                  TextPosition(offset: textEditingController.text.length),
                );
            }
          },
          child: TextFormField(
            key: const Key('description'),
            maxLines: 2,
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (String value) {
              onFieldSubmittedCallback();
            },
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              labelText: labelText,
              suffixIcon: BlocBuilder<
                DescriptionAutocompleteCubit,
                DescriptionAutocompleteState
              >(
                builder: (context, state) {
                  if (state.query.isNotEmpty) {
                    return IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        cubit.clearSelection();
                        textEditingController.clear();
                      },
                    );
                  }

                  return const Icon(Icons.description);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
