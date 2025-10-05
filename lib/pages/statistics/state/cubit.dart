import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

import 'state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final ConsumptionRepository consumptionRepository;

  StatisticsCubit({required this.consumptionRepository}) : super(const StatisticsState());

  Future<void> loadConsumptions() async {
    emit(state.copyWith(isLoading: true, consumptions: []));
    try {
      final consumptions = await consumptionRepository.getConsumptions();
      emit(state.copyWith(isLoading: false, consumptions: consumptions));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
