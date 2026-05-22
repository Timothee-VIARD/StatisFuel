import 'package:equatable/equatable.dart';
import 'package:statisfuel/collections/collections.dart';

class DashboardState extends Equatable {
  final Consumption consumption;
  final double? averageConsumption;
  final bool isSubmitting;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const DashboardState({
    required this.consumption,
    this.averageConsumption,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage,
  });

  DashboardState copyWith({
    Consumption? consumption,
    double? averageConsumption,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DashboardState(
      consumption: consumption ?? this.consumption,
      averageConsumption: averageConsumption ?? this.averageConsumption,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [consumption, averageConsumption, isSubmitting, isLoading, isSuccess, errorMessage];
}
