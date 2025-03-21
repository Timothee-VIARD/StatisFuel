
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:statisfuel/collections/collections.dart';
import 'package:statisfuel/utils/csv.dart';

import '../repository_base.dart';
import 'interface.dart';

class ConsumptionRepository extends RepositoryBase implements IConsumptionRepository {
  ConsumptionRepository() {
    _init();
  }

  Future<void> _init() async {
    isar = await getIsar([ConsumptionSchema]);
  }

  @override
  Future<List<Consumption>> getConsumptions() async {
    return isar.collection<Consumption>().where().sortByDateDesc().findAll();
  }

  @override
  Future<Consumption?> getConsumption(int id) async {
    return isar.collection<Consumption>().get(id);
  }

  @override
  Future<void> createConsumption(Consumption consumption) async {
    await isar.writeTxn(() async {
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
    String? place,
    double? litersPer100km,
  }) async {
    await isar.writeTxn(() async {
      final consumption = await isar.collection<Consumption>().get(id);
      if (consumption == null) return;

      if (date != null) consumption.date = date;
      if (totalPrice != null) consumption.totalPrice = totalPrice;
      if (pricePerLiter != null) consumption.pricePerLiter = pricePerLiter;
      if (liters != null) consumption.liters = liters;
      if (distance != null) consumption.distance = distance;
      if (mileage != null) consumption.mileage = mileage;
      if (place != null) consumption.place = place;

      await isar.collection<Consumption>().put(consumption);
    });
  }

  @override
  Future<void> deleteConsumption(int id) async {
    await isar.writeTxn(() async {
      await isar.collection<Consumption>().delete(id);
    });
  }

  @override
  Future<void> deleteAllConsumptions() async {
    await isar.writeTxn(() async {
      await isar.collection<Consumption>().clear();
    });
  }

  @override
  Future<void> exportToCsv() async {
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
        consumption.date?.toIso8601String() ?? '',
        consumption.totalPrice ?? '',
        consumption.pricePerLiter ?? '',
        consumption.liters ?? '',
        consumption.distance ?? '',
        consumption.mileage ?? '',
        consumption.place ?? '',
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
    try {
      final fields = await CsvUtils.importFromCsv();

      for (var i = 1; i < fields.length; i++) {
        final row = fields[i];
        final consumption = Consumption()
          ..date = DateTime.parse(row[0])
          ..totalPrice = row[1]
          ..pricePerLiter = row[2]
          ..liters = row[3]
          ..distance = row[4]
          ..mileage = row[5]
          ..place = row[6];

        await isar.writeTxn(() async {
          await isar.collection<Consumption>().put(consumption);
        });
      }
      Logger().i('Imported consumptions from CSV');
    } catch (e) {
      Logger().e('Error during CSV import', error: e);
      rethrow;
    }
  }
}
