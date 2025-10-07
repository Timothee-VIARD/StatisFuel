import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/global/location/controller/state.dart';
import 'package:statisfuel/utils/location.dart'; // ton service

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> fetchLocation() async {
    emit(LocationLoading());

    try {
      final location = await LocationService.getCurrentLocation();

      if (location == null) {
        emit(LocationError('Impossible d\'obtenir la position.'));
      } else {
        emit(LocationLoaded(location));
      }
    } catch (e) {
      emit(LocationError('Erreur : ${e.toString()}'));
    }
  }

  void fetchLocationFromName(String name) async {
    emit(LocationLoading());

    try {
      final location = await LocationService.getLocationFromAddress(name);

      if (location == null) {
        emit(LocationError('Impossible d\'obtenir la position.'));
      } else {
        emit(LocationLoaded(location));
      }
    } catch (e) {
      emit(LocationError('Erreur : ${e.toString()}'));
    }
  }

  

  void clear() => emit(LocationInitial());
}
