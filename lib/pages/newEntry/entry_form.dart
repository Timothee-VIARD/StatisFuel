// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:intl/intl.dart';
// import 'package:statisfuel/collections/consumption/consumption.dart';
// import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
// import 'package:statisfuel/i18n/strings.g.dart';
// import 'package:statisfuel/pages/newEntry/state/cubit.dart';
// import 'package:statisfuel/pages/newEntry/state/state.dart';
// import 'package:statisfuel/repositories/consumption/implementation.dart';
// import 'package:vph_web_date_picker/vph_web_date_picker.dart';

// class EntryForm extends StatelessWidget {
//   final Consumption? consumption;
//   final void Function()? onSave;
//   final void Function()? onDelete;

//   const EntryForm({super.key, this.consumption, this.onSave, this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => EntryFormCubit(
//         consumptionRepository: GetIt.I<ConsumptionRepository>(),
//       ),
//       child: EntryFormView(consumption: consumption, onSave: onSave, onDelete: onDelete),
//     );
//   }
// }

// class EntryFormView extends StatefulWidget {
//   final Consumption? consumption;
//   final void Function()? onSave;
//   final void Function()? onDelete;

//   const EntryFormView({super.key, this.consumption, this.onSave, this.onDelete});

//   @override
//   State<EntryFormView> createState() => _EntryFormViewState();
// }

// class _EntryFormViewState extends State<EntryFormView> {
//   final _formKey = GlobalKey<FormState>();
//   final _dateController = TextEditingController();
//   final _totalPriceController = TextEditingController();
//   final _pricePerLiterController = TextEditingController();
//   final _litersController = TextEditingController();
//   final _distanceController = TextEditingController();
//   final _mileageController = TextEditingController();
//   final _placeController = TextEditingController();

//   final _dateFocus = FocusNode();
//   final _totalPriceFocus = FocusNode();
//   final _pricePerLiterFocus = FocusNode();
//   final _litersFocus = FocusNode();
//   final _distanceFocus = FocusNode();
//   final _mileageFocus = FocusNode();
//   final _placeFocus = FocusNode();
//   final _submitFocus = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.consumption != null) {
//       _dateController.text = widget.consumption!.date != null
//           ? DateFormat('dd/MM/yyyy').format(widget.consumption!.date!)
//           : '';
//       _totalPriceController.text =
//           widget.consumption!.totalPrice != null ? widget.consumption!.totalPrice!.toString() : '';
//       _pricePerLiterController.text = widget.consumption!.pricePerLiter != null
//           ? widget.consumption!.pricePerLiter!.toString()
//           : '';
//       _litersController.text =
//           widget.consumption!.liters != null ? widget.consumption!.liters!.toString() : '';
//       _distanceController.text =
//           widget.consumption!.distance != null ? widget.consumption!.distance!.toString() : '';
//       _mileageController.text =
//           widget.consumption!.mileage != null ? widget.consumption!.mileage!.toString() : '';
//       _placeController.text = widget.consumption!.place ?? '';
//     }
//   }

//   @override
//   void dispose() {
//     _dateController.dispose();
//     _dateFocus.dispose();
//     _totalPriceFocus.dispose();
//     _pricePerLiterFocus.dispose();
//     _litersFocus.dispose();
//     _distanceFocus.dispose();
//     _mileageFocus.dispose();
//     _placeFocus.dispose();
//     _submitFocus.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext buildContext) {
//     return BlocConsumer<EntryFormCubit, EntryFormState>(
//       listener: (context, state) {
//         if (state.isSuccess) {
//           context.read<NotificationCubit>().showSuccess(t.global.forms.success);
//           context.read<EntryFormCubit>().resetForm();
//         }

//         if (state.errorMessage != null) {
//           context.read<NotificationCubit>().showError(state.errorMessage!);
//         }

//         _dateController.text = state.consumption.date != null
//             ? DateFormat('dd/MM/yyyy').format(state.consumption.date!)
//             : '';
//       },
//       builder: (context, state) {
//         return Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 24),
//               TextFormField(
//                 controller: _dateController,
//                 focusNode: _dateFocus,
//                 readOnly: true,
//                 onTap: () async {
//                   final pickedDateRange = await showWebDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     asDialog: true,
//                   );
//                   if (pickedDateRange != null && context.mounted) {
//                     context.read<EntryFormCubit>().setDate(pickedDateRange.start);
//                     FocusScope.of(context).requestFocus(_totalPriceFocus);
//                   }
//                 },
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.date,
//                   border: const OutlineInputBorder(),
//                   suffixIcon: const Icon(Icons.calendar_today),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _totalPriceController,
//                 focusNode: _totalPriceFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(_pricePerLiterFocus);
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.totalPrice,
//                   border: const OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 onChanged: (value) =>
//                     context.read<EntryFormCubit>().setTotalPrice(double.tryParse(value)),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _pricePerLiterController,
//                 focusNode: _pricePerLiterFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(_litersFocus);
//                 },
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.pricePerLiter,
//                   border: const OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
//                 onChanged: (value) =>
//                     context.read<EntryFormCubit>().setPricePerLiter(double.tryParse(value)),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _litersController,
//                 focusNode: _litersFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(_distanceFocus);
//                 },
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.liters,
//                   border: const OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
//                 onChanged: (value) =>
//                     context.read<EntryFormCubit>().setLiters(double.tryParse(value)),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _distanceController,
//                 focusNode: _distanceFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(_mileageFocus);
//                 },
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.distance,
//                   border: const OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
//                 onChanged: (value) =>
//                     context.read<EntryFormCubit>().setDistance(double.tryParse(value)),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _mileageController,
//                 focusNode: _mileageFocus,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(_placeFocus);
//                 },
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.mileage,
//                   border: const OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
//                 onChanged: (value) =>
//                     context.read<EntryFormCubit>().setMileage(double.tryParse(value)),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _placeController,
//                 focusNode: _placeFocus,
//                 textInputAction: TextInputAction.done,
//                 onTapOutside: (PointerEvent event) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: t.consumption.place,
//                   border: const OutlineInputBorder(),
//                 ),
//                 onChanged: (value) => context.read<EntryFormCubit>().setPlace(value),
//               ),
//               const SizedBox(height: 24),
//               BlocBuilder<EntryFormCubit, EntryFormState>(
//                 buildWhen: (previous, current) => previous.isSubmitting != current.isSubmitting,
//                 builder: (context, state) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (widget.consumption != null)
//                         ElevatedButton(
//                           onPressed: state.isSubmitting
//                               ? null
//                               : () {
//                                   widget.onDelete?.call();
//                                 },
//                           child: state.isSubmitting
//                               ? const CircularProgressIndicator()
//                               : Text(t.global.forms.save),
//                         ),
//                       ElevatedButton(
//                         focusNode: _submitFocus,
//                         onPressed: state.isSubmitting
//                             ? null
//                             : () {
//                                 if (_formKey.currentState!.validate()) {
//                                   context
//                                       .read<EntryFormCubit>()
//                                       .submitForm(id: widget.consumption?.id);
//                                   widget.onSave?.call();
//                                 }
//                               },
//                         child: state.isSubmitting
//                             ? const CircularProgressIndicator()
//                             : Text(t.global.forms.save),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
