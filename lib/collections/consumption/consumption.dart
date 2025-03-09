import 'package:isar/isar.dart';

part "consumption.g.dart";

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
  double? litersPer100km;

  Consumption({
    this.date,
    this.totalPrice,
    this.pricePerLiter,
    this.liters,
    this.distance,
    this.mileage,
    this.place,
  });

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
      date: date ?? this.date,
      totalPrice: totalPrice ?? this.totalPrice,
      pricePerLiter: pricePerLiter ?? this.pricePerLiter,
      liters: liters ?? this.liters,
      distance: distance ?? this.distance,
      mileage: mileage ?? this.mileage,
      place: place ?? this.place,
    );
  }
}
