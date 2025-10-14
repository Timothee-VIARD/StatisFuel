import 'package:isar/isar.dart';

part 'location.g.dart';

@embedded
class Location {
  /// The name associated with the placemark.
  final String? name;

  /// The street associated with the placemark.
  final String? street;

  /// The abbreviated country name, according to the two letter (alpha-2) [ISO standard](https://www.iso.org/iso-3166-country-codes.html).
  final String? isoCountryCode;

  /// The name of the country associated with the placemark.
  final String? country;

  /// The postal code associated with the placemark.
  final String? postalCode;

  /// The name of the state or province associated with the placemark.
  final String? administrativeArea;

  /// Additional administrative area information for the placemark.
  final String? subAdministrativeArea;

  /// The name of the city associated with the placemark.
  final String? locality;

  /// Additional city-level information for the placemark.
  final String? subLocality;

  /// The street address associated with the placemark.
  final String? thoroughfare;

  /// Additional street address information for the placemark.
  final String? subThoroughfare;

  final double? latitude;

  final double? longitude;

  Location({
    this.name,
    this.street,
    this.isoCountryCode,
    this.country,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare,
    this.latitude,
    this.longitude,
  });

  Location copyWith({
    String? name,
    String? street,
    String? isoCountryCode,
    String? country,
    String? postalCode,
    String? administrativeArea,
    String? subAdministrativeArea,
    String? locality,
    String? subLocality,
    String? thoroughfare,
    String? subThoroughfare,
    double? latitude,
    double? longitude,
  }) {
    return Location(
      name: name ?? this.name,
      street: street ?? this.street,
      isoCountryCode: isoCountryCode ?? this.isoCountryCode,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      administrativeArea: administrativeArea ?? this.administrativeArea,
      subAdministrativeArea:
          subAdministrativeArea ?? this.subAdministrativeArea,
      locality: locality ?? this.locality,
      subLocality: subLocality ?? this.subLocality,
      thoroughfare: thoroughfare ?? this.thoroughfare,
      subThoroughfare: subThoroughfare ?? this.subThoroughfare,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return '$name,$street,$isoCountryCode,$country,$postalCode,$administrativeArea,$subAdministrativeArea,$locality,$subLocality,$thoroughfare,$subThoroughfare,$latitude,$longitude';
  }

  Location fromString(String str) {
    final parts = str.split(',');
    return Location(
      name: parts[0] != 'null' ? parts[0] : null,
      street: parts[1] != 'null' ? parts[1] : null,
      isoCountryCode: parts[2] != 'null' ? parts[2] : null,
      country: parts[3] != 'null' ? parts[3] : null,
      postalCode: parts[4] != 'null' ? parts[4] : null,
      administrativeArea: parts[5] != 'null' ? parts[5] : null,
      subAdministrativeArea: parts[6] != 'null' ? parts[6] : null,
      locality: parts[7] != 'null' ? parts[7] : null,
      subLocality: parts[8] != 'null' ? parts[8] : null,
      thoroughfare: parts[9] != 'null' ? parts[9] : null,
      subThoroughfare: parts[10] != 'null' ? parts[10] : null,
      latitude: parts[11] != 'null' ? double.tryParse(parts[11]) : null,
      longitude: parts[12] != 'null' ? double.tryParse(parts[12]) : null,
    );
  }

  String get title {
    return '${street ?? ''}${(street != null && locality != null) ? ', ' : ''}${locality ?? ''}';
  }

  String get shortTitle {
    return locality ?? '';
  }
}
