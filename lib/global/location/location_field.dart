import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/collections/location/location.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/style/app_config.dart';
import 'package:statisfuel/utils/location.dart';

class LocationField extends StatefulWidget {
  final Function(Location? location) onChanged;
  final Function(PointerEvent event)? onTapOutside;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final Location? initialValue;

  const LocationField({
    super.key,
    required this.onChanged,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.textInputAction,
    this.decoration,
    this.validator,
    this.initialValue,
  });

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  late final TextEditingController _controller;
  late final ValueNotifier<_LocationUiState> _state;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue?.title);
    _state = ValueNotifier(const _LocationUiState());
    _fetchCurrentLocation();
  }

  @override
  void dispose() {
    _controller.dispose();
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<_LocationUiState>(
      valueListenable: _state,
      builder: (context, ui, _) {
        final isLoading = ui.isLoading;

        return Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                focusNode: widget.focusNode,
                textInputAction: widget.textInputAction,
                onTapOutside: widget.onTapOutside,
                onEditingComplete: () {
                  _fetchLocationFromName(_controller.value.text);
                  widget.onEditingComplete?.call();
                },
                onFieldSubmitted: widget.onFieldSubmitted,
                decoration:
                    (widget.decoration ?? const InputDecoration()).copyWith(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isLoading)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      else
                        IconButton(
                          onPressed: () =>
                              _fetchLocationFromName(_controller.value.text),
                          icon: const Icon(
                            Icons.search,
                          ),
                        ),
                    ],
                  ),
                ),
                validator: widget.validator,
              ),
            ),
          ],
        );
      },
    );
  }

  void _setLoading(bool loading) {
    _state.value = _state.value.copyWith(isLoading: loading);
  }

  void _applyLocation(Location location) {
    _controller.text = location.title;
    widget.onChanged(location);
    _state.value = _state.value.copyWith(location: location);
  }

  void _showError(String message) {
    context.read<NotificationCubit>().showError(message);
  }

  Future<void> _fetchCurrentLocation() async {
    _setLoading(true);
    try {
      final location = await LocationService.getCurrentLocation();
      if (location == null) {
        _showError('Impossible d\'obtenir la position.');
        return;
      }
      _applyLocation(location);
    } catch (e) {
      _showError('Erreur : ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _fetchLocationFromName(String name) async {
    // Si l'utilisateur n'a rien tapé, ne lance pas la requête
    if (name.trim().isEmpty) return;
    _setLoading(true);
    try {
      final location = await LocationService.getLocationFromAddress(name);
      if (location == null) {
        _showError('Impossible d\'obtenir la position.');
        return;
      }
      _applyLocation(location);
    } catch (e) {
      _showError('Erreur : ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }
}

class _LocationUiState {
  final bool isLoading;
  final Location? location;

  const _LocationUiState({this.isLoading = false, this.location});

  _LocationUiState copyWith({
    bool? isLoading,
    Location? location,
  }) {
    return _LocationUiState(
      isLoading: isLoading ?? this.isLoading,
      location: location ?? this.location,
    );
  }
}
