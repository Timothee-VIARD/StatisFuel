import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
import 'package:statisfuel/i18n/strings.g.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.date,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.totalPrice,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.pricePerLiter,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.liters,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.distance,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.mileage,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              labelText: t.newEntryPage.place,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                context.read<NotificationCubit>().showSuccess(t.global.forms.success);
              }
            },
            child: Text(t.global.forms.save),
          ),
        ],
      ),
    );
  }
}
