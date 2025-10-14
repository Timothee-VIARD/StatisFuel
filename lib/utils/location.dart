import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:statisfuel/collections/location/location.dart';

class LocationService {
  static Future<Location?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) return null;

    // Récupère la position
    final pos = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    // Géocodage inverse
    final placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    final place = placemarks.first;

    return Location(
      name: place.name,
      street: place.street,
      isoCountryCode: place.isoCountryCode,
      country: place.country,
      postalCode: place.postalCode,
      administrativeArea: place.administrativeArea,
      subAdministrativeArea: place.subAdministrativeArea,
      locality: place.locality,
      subLocality: place.subLocality,
      thoroughfare: place.thoroughfare,
      subThoroughfare: place.subThoroughfare,
      latitude: pos.latitude,
      longitude: pos.longitude,
    );
  }

  static Future<Location?> getLocationFromAddress(String address) async {
    final locations = await locationFromAddress(address);
    if (locations.isEmpty) return null;
    final location = locations.first;

    final placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    final place = placemarks.first;

    return Location(
      name: place.name,
      street: place.street,
      isoCountryCode: place.isoCountryCode,
      country: place.country,
      postalCode: place.postalCode,
      administrativeArea: place.administrativeArea,
      subAdministrativeArea: place.subAdministrativeArea,
      locality: place.locality,
      subLocality: place.subLocality,
      thoroughfare: place.thoroughfare,
      subThoroughfare: place.subThoroughfare,
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
}
