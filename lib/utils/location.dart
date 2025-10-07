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
    final address = "${place.name ?? ''}, ${place.locality ?? ''}";

    return Location(
      title: address,
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
      title: '${place.name}, ${place.locality}',
      address: place.thoroughfare,
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
}
