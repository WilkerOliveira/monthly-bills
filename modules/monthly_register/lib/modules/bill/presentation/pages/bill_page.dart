import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/core/translation/register_strings.dart';
import 'package:monthly_register/modules/bill/presentation/cubit/bill_cubit.dart';
import 'package:monthly_register/modules/bill/presentation/cubit/bill_state.dart';
import 'package:monthly_register/modules/bill/presentation/widgets/cubit/description_autocomplete_cubit.dart';
import 'package:monthly_register/modules/bill/presentation/widgets/description_autocomplete_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key, this.currentBill});

  final BillEntity? currentBill;

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> with FormValidationsMixin {
  late RegisterStrings strings;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recurringMonthsController =
      TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _extraInfoController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();
  bool _isPaid = false;
  BillEntity _bill = BillEntity.empty();
  @override
  void initState() {
    super.initState();
    strings = MonthlyDI.I.get<RegisterStrings>();
    if (widget.currentBill != null) {
      _loadCurrentBill(widget.currentBill!);
    }
  }

  void _loadCurrentBill(BillEntity billEntity) {
    _bill = widget.currentBill!;
    _amountController.text = _bill.amount.formatToCurrency(strings.locale);
    _dueDateController.text = _bill.dueDate.toLocaleDateFormat(strings.locale);
    _paymentController.text =
        _bill.paymentDate?.toLocaleDateFormat(strings.locale) ?? '';
    _extraInfoController.text = _bill.extraInfo ?? '';
    _recurringMonthsController.text = _bill.recurrences?.toString() ?? '';
    _isPaid = _bill.paid;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _dueDateController.dispose();
    _paymentController.dispose();
    _extraInfoController.dispose();
    _recurringMonthsController.dispose();
    super.dispose();
  }

  void _clearAll() {
    _amountController.clear();
    _dueDateController.clear();
    _paymentController.clear();
    _extraInfoController.clear();
    _recurringMonthsController.clear();
    _bill = BillEntity.empty();
    _isPaid = false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MonthlyDI.I.get<BillCubit>()),
        BlocProvider(
          create:
              (context) =>
                  MonthlyDI.I.get<DescriptionAutocompleteCubit>()..init(),
        ),
      ],
      child: BlocListener<BillCubit, BillState>(
        listener: (context, state) {
          switch (state) {
            case BillSavedState():
              _clearAll();
              context.read<DescriptionAutocompleteCubit>().clearSelection();
              MonthlySnackBar.success(
                context,
                message: strings.billSavedSuccessfully,
              );
            case BillError():
              MonthlySnackBar.error(
                context,
                message: strings.billSavedSuccessfully,
              );
            case BillDeleted():
              _clearAll();
              MonthlySnackBar.success(
                context,
                message: strings.billDeletedSuccessfully,
              );
            default:
              break;
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(strings.billTitle),
              actions: [
                Builder(
                  builder:
                      (BuildContext innerContext) => IconButton(
                        onPressed: () {
                          confirmDeleteBill(innerContext);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                ),
              ],
            ),
            body: BlocBuilder<BillCubit, BillState>(
              builder: (context, state) {
                return BasePage(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: vNormalSpace),
                                BillTypeDropdown(
                                  initialValue:
                                      _bill.category.isNotEmpty
                                          ? BillTypesEnum.toBillType(
                                            _bill.category,
                                          )
                                          : null,
                                  onChanged: (BillTypesEnum? value) {
                                    if (value != null) {
                                      _bill = _bill.copyWith(
                                        category: value.key,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: vSmallSpace),
                                DescriptionAutocompleteWidget(
                                  initialValue: _bill.name,
                                  labelText: strings.description,
                                  onSelected: (String value) {
                                    _bill = _bill.copyWith(name: value);
                                  },
                                  validator:
                                      (value) => validateRequiredField(
                                        message: strings.requiredField,
                                        value: value,
                                      ),
                                  onSaved: (newValue) {
                                    _bill = _bill.copyWith(name: newValue);
                                  },
                                ),
                                SizedBox(height: vSmallSpace),
                                TextFormField(
                                  key: const Key('amount'),
                                  controller: _amountController,
                                  decoration: InputDecoration(
                                    labelText: strings.amount,
                                    suffixIcon: const Icon(Icons.attach_money),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator:
                                      (value) => validateRequiredField(
                                        message: strings.requiredField,
                                        value: value,
                                      ),
                                  onSaved: (newValue) {
                                    _bill = _bill.copyWith(
                                      amount: newValue?.parseCurrencyToDouble(
                                        strings.locale,
                                      ),
                                    );
                                  },
                                  inputFormatters: [
                                    currencyTextInputFormatter(strings.locale),
                                  ],
                                ),
                                SizedBox(height: vSmallSpace),
                                TextFormField(
                                  key: const Key('dueDate'),
                                  controller: _dueDateController,
                                  decoration: InputDecoration(
                                    labelText: strings.dueDate,
                                    suffixIcon: GestureDetector(
                                      onTap:
                                          () =>
                                              _openCalendar(_dueDateController),
                                      child: const Icon(Icons.today),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator:
                                      (value) => validateDateField(
                                        locale: strings.locale,
                                        requiredFieldMessage:
                                            strings.requiredField,
                                        invalidDateMessage: strings.invalidDate,
                                        required: true,
                                        value: value,
                                      ),
                                  onSaved: (newValue) {
                                    _bill = _bill.copyWith(
                                      dueDate: newValue?.parseToDateTime(
                                        strings.locale,
                                      ),
                                    );
                                  },
                                  inputFormatters: [
                                    DateInputFormatter(locale: strings.locale),
                                  ],
                                ),
                                SizedBox(height: vSmallSpace),
                                TextFormField(
                                  key: const Key('extraInfo'),
                                  controller: _extraInfoController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText: strings.extraInfo,
                                    suffixIcon: const Icon(Icons.notes),
                                  ),
                                  onSaved: (newValue) {
                                    _bill = _bill.copyWith(extraInfo: newValue);
                                  },
                                ),
                                SizedBox(height: vSmallSpace),
                                TextFormField(
                                  key: const Key('recurringMonths'),
                                  controller: _recurringMonthsController,
                                  decoration: InputDecoration(
                                    labelText: strings.recurringMonths,
                                    suffixIcon: const Icon(Icons.repeat),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onSaved: (newValue) {
                                    if (newValue != null &&
                                        newValue.isNotEmpty) {
                                      _bill = _bill.copyWith(
                                        recurrences: int.parse(newValue),
                                      );
                                    }
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                                SizedBox(height: vSmallSpace),
                                Row(
                                  children: [
                                    Text(strings.isPaid),
                                    Checkbox(
                                      key: const Key('isPaid'),
                                      value: _isPaid,
                                      onChanged: (bool? checked) {
                                        setState(() {
                                          _isPaid = checked ?? false;
                                          _bill = _bill.copyWith(
                                            paid: checked ?? false,
                                          );
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        key: const Key('paymentDate'),
                                        controller: _paymentController,
                                        decoration: InputDecoration(
                                          labelText: strings.paymentDate,
                                          suffixIcon: GestureDetector(
                                            onTap:
                                                () => _openCalendar(
                                                  _paymentController,
                                                ),
                                            child: const Icon(
                                              Icons.event_available,
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator:
                                            (value) => validateDateField(
                                              locale: strings.locale,
                                              requiredFieldMessage:
                                                  strings.requiredField,
                                              invalidDateMessage:
                                                  strings.invalidDate,
                                              required: false,
                                              value: value,
                                            ),
                                        onSaved: (newValue) {
                                          _bill = _bill.copyWith(
                                            paymentDate: newValue
                                                ?.parseToDateTime(
                                                  strings.locale,
                                                ),
                                          );
                                        },
                                        inputFormatters: [
                                          DateInputFormatter(
                                            locale: strings.locale,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: vNormalSpace),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SimpleButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            context.read<BillCubit>().saveBill(_bill);
                          }
                        },
                        label: strings.save,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void confirmDeleteBill(BuildContext innerContext) {
    AppBottomSheetMessage.showChoice(
      context: innerContext,
      bottomSheetMessage: BottomSheetMessage(
        title: strings.deleteBillTitle,
        message:
            _bill.isRecurring
                ? strings.deleteBillRecurringMessage
                : strings.deleteBillMessage,
        onButtonPressed: () {
          innerContext.read<BillCubit>().removeBill(
            _bill,
            removeRecurring: _bill.isRecurring,
          );
        },
        onClosePressed: () {
          if (_bill.isRecurring) {
            innerContext.read<BillCubit>().removeBill(_bill);
          }
          AppBottomSheetMessage.closeBottomSheet(innerContext);
        },
        firstButtonLabel: strings.deleteBillConfirmButton,
        secondButtonLabel:
            _bill.isRecurring
                ? strings.deleteOnlyCurrentBill
                : strings.deleteBillCancelButton,
      ),
    );
  }

  Future<void> _openCalendar(TextEditingController controller) async {
    final picked = await showDatePickerDialog(
      context: context,
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toLocaleDateFormat(strings.locale);
      });
    }
  }
}
