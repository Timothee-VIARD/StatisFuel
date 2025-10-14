import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

import 'state.dart';

class NewConsumptionCubit extends Cubit<NewConsumptionState> {
  final ConsumptionRepository _consumptionRepository;

  NewConsumptionCubit({
    required ConsumptionRepository consumptionRepository,
  })  : _consumptionRepository = consumptionRepository,
        super(NewConsumptionState(
            consumption: Consumption(date: DateTime.now()),),);

  void initializeWithConsumption(Consumption consumption) {
    emit(state.copyWith(consumption: consumption));
  }

  void updateDate(DateTime date) {
    final updatedConsumption = state.consumption.copyWith(date: date);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void updateTotalPrice(double? value) {
    final updatedConsumption = state.consumption.copyWith(totalPrice: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void updatePricePerLiter(double? value) {
    final updatedConsumption = state.consumption.copyWith(pricePerLiter: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void updateLiters(double? value) {
    final updatedConsumption = state.consumption.copyWith(liters: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void updateDistance(double? value) {
    final updatedConsumption = state.consumption.copyWith(distance: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void updateMileage(double? value) {
    final updatedConsumption = state.consumption.copyWith(mileage: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void updateLocation(Location? value) {
    final updatedConsumption = state.consumption.copyWith(location: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  Future<void> submitForm({int? id}) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      if (id == null) {
        await _consumptionRepository.createConsumption(state.consumption);
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        await _consumptionRepository.updateConsumption(
          id,
          date: state.consumption.date,
          totalPrice: state.consumption.totalPrice,
          pricePerLiter: state.consumption.pricePerLiter,
          liters: state.consumption.liters,
          distance: state.consumption.distance,
          mileage: state.consumption.mileage,
          location: state.consumption.location,
        );
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      }
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void resetForm() {
    emit(NewConsumptionState(consumption: Consumption(date: DateTime.now())));
  }
}
