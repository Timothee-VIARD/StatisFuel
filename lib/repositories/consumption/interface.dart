import 'package:isar/isar.dart';
import 'package:statisfuel/collections/collections.dart';

abstract class IConsumptionRepository {
  Future<List<Consumption>> getConsumptions();

  Future<Consumption?> getConsumption(int id);

  Future<void> createConsumption(Consumption consumption);

  Future<void> updateConsumption(
    Id id, {
    DateTime? date,
    double? totalPrice,
    double? pricePerLiter,
    double? liters,
    double? distance,
    double? mileage,
    String? place,
    double? litersPer100km,
  });

  Future<void> deleteConsumption(int id);

  Future<void> deleteAllConsumptions();

  Future<void> exportToCsv();

  Future<void> importFromCsv();
}
