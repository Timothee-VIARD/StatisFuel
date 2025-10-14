import 'package:equatable/equatable.dart';
import 'package:statisfuel/collections/collections.dart';

class NewConsumptionState extends Equatable {
  final Consumption consumption;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const NewConsumptionState({
    required this.consumption,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  NewConsumptionState copyWith({
    Consumption? consumption,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return NewConsumptionState(
      consumption: consumption ?? this.consumption,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [consumption, isSubmitting, isSuccess, errorMessage];
}