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
            consumption: Consumption(
              date: DateTime.now(),
            ),
          ),
        );

  Future<void> createConsumption(Consumption consumption) async {
    try {
      await _consumptionRepository.createConsumption(consumption);
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
