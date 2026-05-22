import 'package:isar_community/isar.dart';
import 'package:logger/logger.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/utils/csv.dart';

import '../repository_base.dart';
import 'interface.dart';

class ConsumptionRepository extends RepositoryBase
    implements IConsumptionRepository {
  late final Future<void> _initFuture;

  ConsumptionRepository() {
    _initFuture = _init();
  }

  Future<void> _init() async {
    isar = await getIsar([ConsumptionSchema]);
  }

  Future<void> _ensureReady() => _initFuture;

  @override
  Future<List<Consumption>> getConsumptions() async {
    await _ensureReady();
    return isar.collection<Consumption>().where().sortByDateDesc().findAll();
  }

  @override
  Future<Consumption?> getConsumption(int id) async {
    await _ensureReady();
    return isar.collection<Consumption>().get(id);
  }

  @override
  Future<void> createConsumption(Consumption consumption) async {
    await _ensureReady();
    await isar.writeTxn(() async {
      consumption.setLitersPer100km();
      consumption.setCostPerKm();
      await isar.collection<Consumption>().put(consumption);
    });
  }

  @override
  Future<void> updateConsumption(
    Id id, {
    DateTime? date,
    double? totalPrice,
    double? pricePerLiter,
    double? liters,
    double? distance,
    double? mileage,
    Location? location,
  }) async {
    await _ensureReady();
    await isar.writeTxn(() async {
      final consumption = await isar.collection<Consumption>().get(id);
      if (consumption == null) return;

      consumption.date = date ?? consumption.date;
      consumption.totalPrice = totalPrice ?? consumption.totalPrice;
      consumption.pricePerLiter = pricePerLiter ?? consumption.pricePerLiter;
      consumption.liters = liters ?? consumption.liters;
      consumption.distance = distance ?? consumption.distance;
      consumption.mileage = mileage ?? consumption.mileage;
      consumption.location = location ?? consumption.location;
      consumption.setLitersPer100km();
      consumption.setCostPerKm();
      await isar.collection<Consumption>().put(consumption);
    });
  }

  @override
  Future<void> deleteConsumption(int id) async {
    await _ensureReady();
    await isar.writeTxn(() async {
      await isar.collection<Consumption>().delete(id);
    });
  }

  @override
  Future<void> deleteAllConsumptions() async {
    await _ensureReady();
    await isar.writeTxn(() async {
      await isar.collection<Consumption>().clear();
    });
  }

  @override
  Future<void> exportToCsv() async {
    await _ensureReady();
    final consumptions = await getConsumptions();

    List<List<dynamic>> data = [
      [
        'Date',
        'Total Price',
        'Price Per Liter',
        'Liters',
        'Distance',
        'Mileage',
        'Place',
      ]
    ];

    for (var consumption in consumptions) {
      data.add([
        consumption.date.toIso8601String(),
        consumption.totalPrice ?? '',
        consumption.pricePerLiter ?? '',
        consumption.liters ?? '',
        consumption.distance ?? '',
        consumption.mileage ?? '',
        consumption.location,
      ]);
    }
    try {
      await CsvUtils.exportToCsv(data);
      Logger().i('Exported consumptions to CSV');
    } catch (e) {
      Logger().e('Error during CSV export', error: e);
      rethrow;
    }
  }

  @override
  Future<void> importFromCsv() async {
    await _ensureReady();
    try {
      final fields = await CsvUtils.importFromCsv();

      for (var i = 1; i < fields.length; i++) {
        final row = fields[i];
        final consumption = Consumption(
          date: DateTime.parse(row[0]),
          totalPrice: row[1],
          pricePerLiter: row[2],
          liters: row[3],
          distance: row[4],
          mileage: row[5],
          location: Location().fromString(row[6]),
        );

        await isar.writeTxn(() async {
          consumption.setLitersPer100km();
          consumption.setCostPerKm();
          await isar.collection<Consumption>().put(consumption);
        });
      }
      Logger().i('Imported consumptions from CSV');
    } catch (e) {
      Logger().e('Error during CSV import', error: e);
      rethrow;
    }
  }

  @override
  Future<double> getAverageConsumption({
    required DateTime startDate,
    DateTime? endDate,
  }) async {
    await _ensureReady();
    final average = await isar
        .collection<Consumption>()
        .where()
        .dateBetween(startDate, endDate ?? DateTime.now())
        .litersPer100kmProperty()
        .average();

    return average.isNaN ? 0 : average;
  }

  @override
  Future<double> getAverageCostPerKm({required DateTime startDate, DateTime? endDate}) async {
    await _ensureReady();
    final result = await isar
        .collection<Consumption>()
        .where()
        .dateBetween(startDate, endDate ?? DateTime.now())
        .costPerKmProperty()
        .average();

    return result.isNaN ? 0 : result;
  }
}
