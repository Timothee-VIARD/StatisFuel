import 'package:isar_community/isar.dart';
import 'package:statisfuel/collections/collections.dart';

abstract class IConsumptionRepository {
  Future<List<Consumption>> getConsumptions();

  Future<Consumption?> getConsumption(int id);

  Future<Consumption?> getLastConsumption();

  Future<void> createConsumption(Consumption consumption);

  Future<void> updateConsumption(
    Id id, {
    DateTime? date,
    double? totalPrice,
    double? pricePerLiter,
    double? liters,
    double? distance,
    double? mileage,
    required Location location,
  });

  Future<void> updateAllConsumptions();

  Future<void> deleteConsumption(int id);

  Future<void> deleteAllConsumptions();

  Future<void> exportToCsv();

  Future<void> importFromCsv();

  Future<double> getAverageConsumption({
    required DateTime startDate,
    DateTime? endDate,
  });

  Future<double> getAverageCostPerKm({
    required DateTime startDate,
    DateTime? endDate,
  });

  Future<double> getAverageDistance({
    required DateTime startDate,
    DateTime? endDate,
  });

  Future<double> getTotalDistance({
    required DateTime startDate,
    DateTime? endDate,
  });

  Future<double> getTotalCost({
    required DateTime startDate,
    DateTime? endDate,
  });
}
