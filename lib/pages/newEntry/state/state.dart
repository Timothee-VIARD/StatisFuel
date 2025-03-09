import 'package:equatable/equatable.dart';
import 'package:statisfuel/collections/collections.dart';

class EntryFormState extends Equatable {
  final Consumption consumption;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const EntryFormState({
    required this.consumption,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  EntryFormState copyWith({
    Consumption? consumption,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return EntryFormState(
      consumption: consumption ?? this.consumption,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [consumption, isSubmitting, isSuccess, errorMessage];
}