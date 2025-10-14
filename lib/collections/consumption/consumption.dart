import 'package:isar/isar.dart';
import 'package:statisfuel/collections/location/location.dart';

part 'consumption.g.dart';

@collection
class Consumption {
  Id id = Isar.autoIncrement;
  DateTime date;
  double? totalPrice;
  double? pricePerLiter;
  double? liters;
  double? distance;
  double? mileage;
  Location? location;

  Consumption({
    this.id = Isar.autoIncrement,
    required this.date,
    this.totalPrice,
    this.pricePerLiter,
    this.liters,
    this.distance,
    this.mileage,
    this.location,
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
    Location? location,
  }) {
    return Consumption(
      id: id,
      date: date ?? this.date,
      totalPrice: totalPrice ?? this.totalPrice,
      pricePerLiter: pricePerLiter ?? this.pricePerLiter,
      liters: liters ?? this.liters,
      distance: distance ?? this.distance,
      mileage: mileage ?? this.mileage,
      location: location ?? this.location,
    );
  }

  bool isComplete() {
    return totalPrice != null &&
        pricePerLiter != null &&
        liters != null &&
        distance != null &&
        mileage != null &&
        location != null;
  }

  @override
  String toString() {
    return 'Consumption{id: $id, date: $date, totalPrice: $totalPrice, pricePerLiter: $pricePerLiter, liters: $liters, distance: $distance, mileage: $mileage, place: $location}';
  }
}
