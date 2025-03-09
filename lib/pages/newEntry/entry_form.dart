import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/newEntry/state/cubit.dart';
import 'package:statisfuel/pages/newEntry/state/state.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:get_it/get_it.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

class EntryForm extends StatelessWidget {
  const EntryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EntryFormCubit(
        consumptionRepository: GetIt.I<ConsumptionRepository>(),
      ),
      child: const EntryFormView(),
    );
  }
}

class EntryFormView extends StatefulWidget {
  const EntryFormView({super.key});

  @override
  State<EntryFormView> createState() => _EntryFormViewState();
}

class _EntryFormViewState extends State<EntryFormView> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  // Définition des FocusNode pour chaque champ
  final _dateFocus = FocusNode();
  final _totalPriceFocus = FocusNode();
  final _pricePerLiterFocus = FocusNode();
  final _litersFocus = FocusNode();
  final _distanceFocus = FocusNode();
  final _mileageFocus = FocusNode();
  final _placeFocus = FocusNode();
  final _submitFocus = FocusNode();

  @override
  void dispose() {
    // Libération des ressources
    _dateController.dispose();
    _dateFocus.dispose();
    _totalPriceFocus.dispose();
    _pricePerLiterFocus.dispose();
    _litersFocus.dispose();
    _distanceFocus.dispose();
    _mileageFocus.dispose();
    _placeFocus.dispose();
    _submitFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EntryFormCubit, EntryFormState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.read<NotificationCubit>().showSuccess(t.global.forms.success);
          context.read<EntryFormCubit>().resetForm();
        }

        if (state.errorMessage != null) {
          context.read<NotificationCubit>().showError(state.errorMessage!);
        }

        _dateController.text = state.consumption.date != null ? DateFormat('dd-MM-yyyy').format(state.consumption.date!) : '';
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              TextFormField(
                controller: _dateController,
                focusNode: _dateFocus,
                readOnly: true,
                onTap: () async {
                  final pickedDateRange = await showWebDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    asDialog: true,
                  );
                  if (pickedDateRange != null && context.mounted) {
                    context.read<EntryFormCubit>().setDate(pickedDateRange.start);
                    FocusScope.of(context).requestFocus(_totalPriceFocus);
                  }
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.date,
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                focusNode: _totalPriceFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_pricePerLiterFocus);
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.totalPrice,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) =>
                    context.read<EntryFormCubit>().setTotalPrice(double.tryParse(value)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                focusNode: _pricePerLiterFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_litersFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.pricePerLiter,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                onChanged: (value) =>
                    context.read<EntryFormCubit>().setPricePerLiter(double.tryParse(value)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                focusNode: _litersFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_distanceFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.liters,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                onChanged: (value) =>
                    context.read<EntryFormCubit>().setLiters(double.tryParse(value)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                focusNode: _distanceFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_mileageFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.distance,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                onChanged: (value) =>
                    context.read<EntryFormCubit>().setDistance(double.tryParse(value)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                focusNode: _mileageFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_placeFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.mileage,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                onChanged: (value) =>
                    context.read<EntryFormCubit>().setMileage(double.tryParse(value)),
              ),
              const SizedBox(height: 8),
              TextFormField(
                focusNode: _placeFocus,
                textInputAction: TextInputAction.done,
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.newEntryPage.place,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) => context.read<EntryFormCubit>().setPlace(value),
              ),
              const SizedBox(height: 24),
              BlocBuilder<EntryFormCubit, EntryFormState>(
                buildWhen: (previous, current) => previous.isSubmitting != current.isSubmitting,
                builder: (context, state) {
                  return ElevatedButton(
                    focusNode: _submitFocus,
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<EntryFormCubit>().submitForm();
                            }
                          },
                    child: state.isSubmitting
                        ? const CircularProgressIndicator()
                        : Text(t.global.forms.save),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
