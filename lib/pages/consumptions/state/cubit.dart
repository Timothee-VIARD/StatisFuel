import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/collections/consumption/consumption.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

import 'state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final ConsumptionRepository consumptionRepository;

  HistoryCubit({required this.consumptionRepository}) : super(const HistoryState());

  Future<void> loadConsumptions() async {
    emit(state.copyWith(isLoading: true, consumptions: []));
    try {
      final consumptions = await consumptionRepository.getConsumptions();
      emit(state.copyWith(isLoading: false, consumptions: consumptions));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> submitConsumption(Consumption consumption, {int? id}) async {
    try {
      if (id == null) {
        await consumptionRepository.createConsumption(consumption);
        final List<Consumption> newConsumptions = [];
        newConsumptions.addAll(state.consumptions);
        newConsumptions.add(consumption);
        newConsumptions.sort((a, b) => (b.date ?? DateTime(0)).compareTo(a.date ?? DateTime(0)));
        emit(
          state.copyWith(
            isLoading: false,
            consumptions: newConsumptions,
            successMessage: 'Added consumption',
          ),
        );
      } else {
        await consumptionRepository.updateConsumption(
          id,
          date: consumption.date,
          totalPrice: consumption.totalPrice,
          pricePerLiter: consumption.pricePerLiter,
          liters: consumption.liters,
          distance: consumption.distance,
          mileage: consumption.mileage,
          place: consumption.place,
        );
        emit(
          state.copyWith(
            isLoading: false,
            consumptions:
                state.consumptions.map((c) => c.id == id ? consumption : c).toList(growable: false)
                  ..sort((a, b) => (b.date ?? DateTime(0)).compareTo(a.date ?? DateTime(0))),
            successMessage: 'Updated consumption',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteConsumption(int id) async {
    emit(state.copyWith(isLoading: true));
    try {
      await consumptionRepository.deleteConsumption(id);
      final consumptions = await consumptionRepository.getConsumptions();
      emit(state.copyWith(isLoading: false, consumptions: consumptions, successMessage: 'Deleted consumption'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> deleteAllConsumptions() async {
    emit(state.copyWith(isLoading: true));
    try {
      await consumptionRepository.deleteAllConsumptions();
      final consumptions = await consumptionRepository.getConsumptions();
      emit(state.copyWith(isLoading: false, consumptions: consumptions, successMessage: 'Deleted all consumptions'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> exportToCsv() async {
    try {
      await consumptionRepository.exportToCsv();
      emit(state.copyWith(successMessage: 'Exported to CSV'));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> importFromCsv() async {
    emit(state.copyWith(isLoading: true));
    try {
      await consumptionRepository.importFromCsv();
      final consumptions = await consumptionRepository.getConsumptions();
      emit(
        state.copyWith(
          isLoading: false,
          consumptions: consumptions,
          successMessage: 'Imported from CSV',
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
