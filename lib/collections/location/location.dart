import 'package:isar/isar.dart';

part 'location.g.dart';

@embedded
class Location {
  String? title;
  String? address;
  double? latitude;
  double? longitude;

  Location({
    this.title,
    this.address,
    this.latitude,
    this.longitude,
  });

  Location copyWith({
    String? title,
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return Location(
      title: title ?? this.title,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return 'Location{title: $title, address: $address, latitude: $latitude, longitude: $longitude}';
  }
}
