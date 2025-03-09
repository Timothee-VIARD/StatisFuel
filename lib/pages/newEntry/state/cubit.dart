import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/pages/newEntry/state/state.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

class EntryFormCubit extends Cubit<EntryFormState> {
  final ConsumptionRepository _consumptionRepository;

  EntryFormCubit({
    required ConsumptionRepository consumptionRepository,
  }) : _consumptionRepository = consumptionRepository,
       super(EntryFormState(consumption: Consumption()));

  void setDate(DateTime date) {
    final updatedConsumption = state.consumption.copyWith(date: date);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void setTotalPrice(double? value) {
    final updatedConsumption = state.consumption.copyWith(totalPrice: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void setPricePerLiter(double? value) {
    final updatedConsumption = state.consumption.copyWith(pricePerLiter: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void setLiters(double? value) {
    final updatedConsumption = state.consumption.copyWith(liters: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void setDistance(double? value) {
    final updatedConsumption = state.consumption.copyWith(distance: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void setMileage(double? value) {
    final updatedConsumption = state.consumption.copyWith(mileage: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  void setPlace(String? value) {
    final updatedConsumption = state.consumption.copyWith(place: value);
    emit(state.copyWith(consumption: updatedConsumption));
  }

  Future<void> submitForm() async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    
    try {
      await _consumptionRepository.createConsumption(state.consumption);
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void resetForm() {
    emit(EntryFormState(consumption: Consumption(), isSuccess: false));
  }
}