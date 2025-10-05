import 'package:isar/isar.dart';

part 'consumption.g.dart';

@collection
class Consumption {
  Id id = Isar.autoIncrement;
  DateTime? date;
  double? totalPrice;
  double? pricePerLiter;
  double? liters;
  double? distance;
  double? mileage;
  String? place;

  Consumption({
    this.id = Isar.autoIncrement,
    this.date,
    this.totalPrice,
    this.pricePerLiter,
    this.liters,
    this.distance,
    this.mileage,
    this.place,
  });

  double? get litersPer100km {
    if (liters != null && distance != null && distance! > 0) {
      return (liters! / distance!) * 100;
    }
    return null;
  }

  Consumption copyWith({
    DateTime? date,
    double? totalPrice,
    double? pricePerLiter,
    double? liters,
    double? distance,
    double? mileage,
    String? place,
  }) {
    return Consumption(
      id: id,
      date: date ?? this.date,
      totalPrice: totalPrice ?? this.totalPrice,
      pricePerLiter: pricePerLiter ?? this.pricePerLiter,
      liters: liters ?? this.liters,
      distance: distance ?? this.distance,
      mileage: mileage ?? this.mileage,
      place: place ?? this.place,
    );
  }

  bool isComplete() {
    return date != null &&
        totalPrice != null &&
        pricePerLiter != null &&
        liters != null &&
        distance != null &&
        mileage != null &&
        place != null;
  }

  @override
  String toString() {
    return 'Consumption{id: $id, date: $date, totalPrice: $totalPrice, pricePerLiter: $pricePerLiter, liters: $liters, distance: $distance, mileage: $mileage, place: $place}';
  }
}
