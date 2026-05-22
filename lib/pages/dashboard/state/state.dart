import 'package:equatable/equatable.dart';
import 'package:statisfuel/collections/collections.dart';

class DashboardState extends Equatable {
  final Consumption? lastConsumption;
  final double? averageConsumption;
  final double? averageCostPerKm;
  final double? averageDistance;
  final double? totalDistance;
  final double? totalCost;
  final bool isSubmitting;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const DashboardState({
    this.lastConsumption,
    this.averageConsumption,
    this.averageCostPerKm,
    this.averageDistance,
    this.totalDistance,
    this.totalCost,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage,
  });

  DashboardState copyWith({
    Consumption? lastConsumption,
    double? averageConsumption,
    double? averageCostPerKm,
    double? averageDistance,
    double? totalDistance,
    double? totalCost,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DashboardState(
      lastConsumption: lastConsumption ?? this.lastConsumption,
      averageConsumption: averageConsumption ?? this.averageConsumption,
      averageCostPerKm: averageCostPerKm ?? this.averageCostPerKm,
      averageDistance: averageDistance ?? this.averageDistance,
      totalDistance: totalDistance ?? this.totalDistance,
      totalCost: totalCost ?? this.totalCost,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        lastConsumption,
        averageConsumption,
        averageCostPerKm,
        averageDistance,
        totalDistance,
        totalCost,
        isSubmitting,
        isLoading,
        isSuccess,
        errorMessage
      ];
}
