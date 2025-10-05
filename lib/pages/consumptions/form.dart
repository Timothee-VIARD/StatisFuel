import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/collections/consumption/consumption.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

class ConsumptionForm extends StatefulWidget {
  final Consumption? consumption;
  final void Function(Consumption consumtpion, int? id) onSave;
  final void Function()? onDelete;

  const ConsumptionForm(this.onSave, {super.key, this.consumption, this.onDelete});

  @override
  State<ConsumptionForm> createState() => _ConsumptionFormState();
}

class _ConsumptionFormState extends State<ConsumptionForm> {
  final _formKey = GlobalKey<FormState>();

  final _dateController = TextEditingController();
  final _totalPriceController = TextEditingController();
  final _pricePerLiterController = TextEditingController();
  final _litersController = TextEditingController();
  final _distanceController = TextEditingController();
  final _mileageController = TextEditingController();
  final _placeController = TextEditingController();

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
      _dateController.text = widget.consumption!.date != null
          ? DateFormat(t.global.date.format).format(widget.consumption!.date!)
          : '';
      _totalPriceController.text =
          widget.consumption!.totalPrice != null ? widget.consumption!.totalPrice!.toString() : '';
      _pricePerLiterController.text = widget.consumption!.pricePerLiter != null
          ? widget.consumption!.pricePerLiter!.toString()
          : '';
      _litersController.text =
          widget.consumption!.liters != null ? widget.consumption!.liters!.toString() : '';
      _distanceController.text =
          widget.consumption!.distance != null ? widget.consumption!.distance!.toString() : '';
      _mileageController.text =
          widget.consumption!.mileage != null ? widget.consumption!.mileage!.toString() : '';
      _placeController.text = widget.consumption!.place ?? '';
    }
  }

  @override
  void dispose() {
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
  Widget build(BuildContext buildContext) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              if (pickedDateRange != null && mounted) {
                _dateController.text = DateFormat(t.global.date.format).format(pickedDateRange.start);
                if (mounted) {
                  FocusScope.of(context).requestFocus(_totalPriceFocus);
                }
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
          const SizedBox(height: 8),
          TextFormField(
            controller: _totalPriceController,
            focusNode: _totalPriceFocus,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_pricePerLiterFocus);
            },
            decoration: InputDecoration(
              isDense: true,
              labelText: t.consumption.totalPrice,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
            onTapOutside: (PointerEvent event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {},
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _pricePerLiterController,
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
              labelText: t.consumption.pricePerLiter,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _litersController,
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
              labelText: t.consumption.liters,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _distanceController,
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
              labelText: t.consumption.distance,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mileageController,
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
              labelText: t.consumption.mileage,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _placeController,
            focusNode: _placeFocus,
            textInputAction: TextInputAction.done,
            onTapOutside: (PointerEvent event) {
              FocusScope.of(context).unfocus();
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
                    if (_formKey.currentState!.validate()) {
                      final consumption = Consumption(
                        date: DateFormat(t.global.date.format).parse(_dateController.text),
                        totalPrice: double.tryParse(_totalPriceController.text),
                        pricePerLiter: double.tryParse(_pricePerLiterController.text),
                        liters: double.tryParse(_litersController.text),
                        distance: double.tryParse(_distanceController.text),
                        mileage: double.tryParse(_mileageController.text),
                        place: _placeController.text,
                      );
                      widget.onSave(consumption, widget.consumption?.id);
                    }
                  },
                  child: Text(t.global.forms.save),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
