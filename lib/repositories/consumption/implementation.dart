import 'package:isar/isar.dart';
import 'package:statisfuel/collections/collections.dart';

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
    return isar.collection<Consumption>().where().findAll();
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
      if (litersPer100km != null) consumption.litersPer100km = litersPer100km;

      await isar.collection<Consumption>().put(consumption);
    });
  }

  @override
  Future<void> deleteConsumption(int id) async {
    await isar.writeTxn(() async {
      await isar.collection<Consumption>().delete(id);
    });
  }
}
