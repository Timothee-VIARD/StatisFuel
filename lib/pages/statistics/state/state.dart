import 'package:equatable/equatable.dart';
import 'package:statisfuel/collections/collections.dart';

class StatisticsState extends Equatable {
  final bool isLoading;
  final List<Consumption> consumptions;
  final String? errorMessage;
  final String? successMessage;

  const StatisticsState({
    this.isLoading = false,
    this.consumptions = const [],
    this.errorMessage,
    this.successMessage,
  });

  StatisticsState copyWith({
    bool? isLoading,
    List<Consumption>? consumptions,
    String? errorMessage,
    String? successMessage,
  }) {
    return StatisticsState(
      isLoading: isLoading ?? this.isLoading,
      consumptions: consumptions ?? this.consumptions,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, consumptions, errorMessage, successMessage];
}
