import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/collections/location/location.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';

import 'controller/cubit.dart';
import 'controller/state.dart';

class LocationField extends StatefulWidget {
  final Function(Location? location) onChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(PointerEvent event)? onTapOutside;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;

  const LocationField({
    super.key,
    required this.onChanged,
    this.focusNode,
    this.textInputAction,
    this.onTapOutside,
    this.decoration,
    this.validator,
  });

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationLoaded) {
            _controller.text = state.location.title ?? '';
            widget.onChanged(state.location);
          } else if (state is LocationError) {
            context.read<NotificationCubit>().showError(state.message);
          }
        },
        builder: (context, state) {
          final isLoading = state is LocationLoading;

          return Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  onChanged: (locationName) => context
                      .read<LocationCubit>()
                      .fetchLocationFromName(locationName),
                  focusNode: widget.focusNode,
                  textInputAction: widget.textInputAction,
                  onTapOutside: widget.onTapOutside,
                  decoration: widget.decoration,
                  validator: widget.validator,
                ),
              ),
              IconButton(
                onPressed: isLoading
                    ? null
                    : () => context.read<LocationCubit>().fetchLocation(),
                icon: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.my_location),
                tooltip: 'Utiliser ma position actuelle',
              ),
            ],
          );
        },
      ),
    );
  }
}
