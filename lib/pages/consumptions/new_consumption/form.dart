import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/collections/consumption/consumption.dart';
import 'package:statisfuel/global/location/location_field.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

import 'controller/cubit.dart';
import 'controller/state.dart';

typedef Selector<T> = BlocSelector<NewConsumptionCubit, NewConsumptionState, T>;

class ConsumptionForm extends StatefulWidget {
  final Consumption? consumption;
  final void Function(Consumption consumption, int? id) onSave;
  final void Function()? onDelete;

  const ConsumptionForm(
    this.onSave, {
    super.key,
    this.consumption,
    this.onDelete,
  });

  @override
  State<ConsumptionForm> createState() => _ConsumptionFormState();
}

class _ConsumptionFormState extends State<ConsumptionForm> {
  final _formKey = GlobalKey<FormState>();
  final NewConsumptionState _formState = NewConsumptionState(
    consumption: Consumption(),
  );

  final _dateFocus = FocusNode();
  final _totalPriceFocus = FocusNode();
  final _pricePerLiterFocus = FocusNode();
  final _litersFocus = FocusNode();
  final _distanceFocus = FocusNode();
  final _mileageFocus = FocusNode();
  final _placeFocus = FocusNode();
  final _submitFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.consumption != null) {
      _formState.copyWith(consumption: widget.consumption);
    }
  }

  @override
  void dispose() {
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
  Widget build(BuildContext buildContext) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => NewConsumptionCubit(
          consumptionRepository: GetIt.I<ConsumptionRepository>(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Selector<DateTime?>(
              selector: (state) => state.consumption.date,
              builder: (context, date) => TextFormField(
                key: UniqueKey(),
                focusNode: _dateFocus,
                readOnly: true,
                initialValue: date != null
                    ? DateFormat(t.global.date.format).format(date)
                    :  DateFormat(t.global.date.format).format(DateTime.now()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.global.forms.required;
                  }
                  return null;
                },
                onTap: () async {
                  final pickedDateRange = await showWebDatePicker(
                    context: context,
                    initialDate: date ?? DateTime.now(),
                    asDialog: true,
                  );
                  if (pickedDateRange != null && context.mounted) {
                    context
                        .read<NewConsumptionCubit>()
                        .updateDate(pickedDateRange.start);
                    FocusScope.of(context).requestFocus(_totalPriceFocus);
                  }
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.consumption.date,
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Selector<double?>(
              selector: (state) => state.consumption.totalPrice,
              builder: (context, field) => TextFormField(
                focusNode: _totalPriceFocus,
                initialValue: field?.toString(),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_pricePerLiterFocus);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.global.forms.required;
                  }
                  if (double.tryParse(value) == null) {
                    return t.global.forms.invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.consumption.totalPrice,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) => context
                    .read<NewConsumptionCubit>()
                    .updateTotalPrice(double.tryParse(value)),
              ),
            ),
            const SizedBox(height: 8),
            Selector<double?>(
              selector: (state) => state.consumption.pricePerLiter,
              builder: (context, field) => TextFormField(
                initialValue: field?.toString(),
                focusNode: _pricePerLiterFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_litersFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.global.forms.required;
                  }
                  if (double.tryParse(value) == null) {
                    return t.global.forms.invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.consumption.pricePerLiter,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                onChanged: (value) => context
                    .read<NewConsumptionCubit>()
                    .updatePricePerLiter(double.tryParse(value)),
              ),
            ),
            const SizedBox(height: 8),
            Selector<double?>(
              selector: (state) => state.consumption.liters,
              builder: (context, liters) => TextFormField(
                initialValue: liters?.toString(),
                focusNode: _litersFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_distanceFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.global.forms.required;
                  }
                  if (double.tryParse(value) == null) {
                    return t.global.forms.invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.consumption.liters,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                onChanged: (value) => context
                    .read<NewConsumptionCubit>()
                    .updateLiters(double.tryParse(value)),
              ),
            ),
            const SizedBox(height: 8),
            Selector<double?>(
              selector: (state) => state.consumption.distance,
              builder: (context, field) => TextFormField(
                initialValue: field?.toString(),
                focusNode: _distanceFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_mileageFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.global.forms.required;
                  }
                  if (double.tryParse(value) == null) {
                    return t.global.forms.invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.consumption.distance,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                onChanged: (value) => context
                    .read<NewConsumptionCubit>()
                    .updateDistance(double.tryParse(value)),
              ),
            ),
            const SizedBox(height: 8),
            Selector<double?>(
              selector: (state) => state.consumption.mileage,
              builder: (context, field) => TextFormField(
                initialValue: field?.toString(),
                focusNode: _mileageFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_placeFocus);
                },
                onTapOutside: (PointerEvent event) {
                  FocusScope.of(context).unfocus();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.global.forms.required;
                  }
                  if (double.tryParse(value) == null) {
                    return t.global.forms.invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: t.consumption.mileage,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                onChanged: (value) => context
                    .read<NewConsumptionCubit>()
                    .updateMileage(double.tryParse(value)),
              ),
            ),
            const SizedBox(height: 8),
            LocationField(
              focusNode: _placeFocus,
              onChanged: (value) =>
                  context.read<NewConsumptionCubit>().updateLocation(value),
              textInputAction: TextInputAction.done,
              onTapOutside: (PointerEvent event) {
                FocusScope.of(context).unfocus();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.global.forms.required;
                }
                return null;
              },
              decoration: InputDecoration(
                isDense: true,
                labelText: t.consumption.place,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
              children: [
                if (widget.consumption != null)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onDelete?.call();
                      },
                      child: Text(t.global.delete),
                    ),
                  ),
                Expanded(
                  child: ElevatedButton(
                    focusNode: _submitFocus,
                    onPressed: () {
                      // Force la validation et l'affichage des erreurs
                      final isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        widget.onSave(
                          context.read<NewConsumptionCubit>().state.consumption,
                          widget.consumption?.id,
                        );
                      }
                    },
                    child: Text(t.global.forms.save),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
