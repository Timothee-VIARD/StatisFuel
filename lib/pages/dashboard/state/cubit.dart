import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/pages/dashboard/state/state.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final ConsumptionRepository _consumptionRepository;

  DashboardCubit({
    required ConsumptionRepository consumptionRepository,
  })  : _consumptionRepository = consumptionRepository,
        super(
          const DashboardState(
            isLoading: true,
          ),
        ) {
    getStats();
  }

  Future<void> createConsumption(Consumption consumption) async {
    try {
      await _consumptionRepository.createConsumption(consumption);
      await getStats();
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> getStats() async {
    try {
      final averageConsumption =
          await _consumptionRepository.getAverageConsumption(
        startDate: DateTime.now()
            .subtract(const Duration(days: 365)), // Année glissante
      );
      final averageCostPerKm =
          await _consumptionRepository.getAverageCostPerKm(
        startDate: DateTime.now()
            .subtract(const Duration(days: 365)), // Année glissante
      );
      final lastConsumption = await _consumptionRepository.getLastConsumption();
      final averageDistance = await _consumptionRepository.getAverageDistance(
        startDate: DateTime.now()
            .subtract(const Duration(days: 365)), // Année glissante
      );
      emit(
        state.copyWith(
          isLoading: false,
          averageConsumption: averageConsumption,
          averageCostPerKm: averageCostPerKm,
          lastConsumption: lastConsumption,
          averageDistance: averageDistance,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
