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
          DashboardState(
            isLoading: true,
            consumption: Consumption(
              date: DateTime.now(),
            ),
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
      emit(
        state.copyWith(
          isLoading: false,
          averageConsumption: averageConsumption,
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
